import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:ghostscript_dart/ghostscript_dart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late int sumResult;
  late Future<int> sumAsyncResult;
  final textController = TextEditingController();
  bool allowSubmit = false;
  String inputFilePath = "";

  @override
  void initState() {
    super.initState();
    textController.addListener(() {
      final text = textController.text.trim();
      setState(() {
        allowSubmit = text.isNotEmpty || inputFilePath.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    // gs.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 25);
    const spacerSmall = SizedBox(height: 10);
    GhostscriptRevision? gsRevision;
    try {
      gsRevision = GhostscriptDart.revision();
    } on UnsupportedError {
      gsRevision = null;
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Native Packages'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  'This calls a native function through FFI that is shipped as source in the package. '
                  'The native code is built as part of the Flutter Runner build.',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                Text(gsRevision.toString()),
                spacerSmall,
                TextField(
                  controller: textController,
                ),
                FilledButton(
                  onPressed: _pickFile,
                  child: const Text("Pick a file"),
                ),
                TextButton(
                  onPressed: allowSubmit ? _onPressed : null,
                  child: const Text("Start"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onPressed() async {
    setState(() {
      allowSubmit = false;
    });

    final gs = await GhostscriptDart.newInstance();
    gs.setEncoding(GS_ARG_ENCODING_UTF8);
    final text = textController.text.trim();
    if (text.isNotEmpty) {
      final output = await gs.initWithArgs(text.split(" "));
      print("initWithArgs: $output");
    } else if (inputFilePath.isNotEmpty) {
      const programName = "flutter";
      final input = [
        "gs",
        "-dBATCH",
        "-dNOPAUSE",
        "-dSAFER",
        "-dAutoRotatePages=/None",
        "-sDEVICE=pdfwrite",
        "-sOutputFile=out.pdf",
        inputFilePath,
        "-c",
        "[/Creator($programName (PSCRIPT5)) /DOCINFO pdfmark",
        "-f"
      ];
      print(input);
      final output = await gs.initWithArgs(input);
      print("initWithArgs: $output");
    }
    print("\n-------------------\n");
    gs.close();

    setState(() {
      allowSubmit = true;
    });
    print("_onPressed done!");
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final file = result.files.single;
    setState(() {
      inputFilePath = file.path!;
      allowSubmit = inputFilePath.isNotEmpty;
    });
  }
}
