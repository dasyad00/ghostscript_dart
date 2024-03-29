// ignore_for_file: always_specify_types
// ignore_for_file: camel_case_types
// ignore_for_file: non_constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
// ignore_for_file: type=lint
import 'dart:ffi' as ffi;

/// Auto-generated Dart bindings for Ghostscript
///
/// Regenerate bindings with `flutter pub run ffigen`.
///
class GhostscriptDartBindings {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  GhostscriptDartBindings(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  GhostscriptDartBindings.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  /// Get version numbers and strings.
  /// This is safe to call at any time.
  /// You should call this first to make sure that the correct version
  /// of the Ghostscript is being used.
  /// pr is a pointer to a revision structure.
  /// len is the size of this structure in bytes.
  /// Returns 0 if OK, or if len too small (additional parameters
  /// have been added to the structure) it will return the required
  /// size of the structure.
  int revision(
    ffi.Pointer<gsapi_revision_s> pr,
    int len,
  ) {
    return _revision(
      pr,
      len,
    );
  }

  late final _revisionPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(
              ffi.Pointer<gsapi_revision_s>, ffi.Int)>>('gsapi_revision');
  late final _revision = _revisionPtr
      .asFunction<int Function(ffi.Pointer<gsapi_revision_s>, int)>();

  /// WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING
  /// On non-threading capable platforms, Ghostscript supports only
  /// one instance. The current implementation uses a global static
  /// instance counter to make sure that only a single instance is
  /// used. If you try to create two instances, the second attempt
  /// will return < 0 and set pinstance to NULL.
  /// WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING
  /// /
  /// /* Create a new instance of Ghostscript.
  /// This instance is passed to most other API functions.
  /// The caller_handle will be provided to callback functions.
  int new_instance(
    ffi.Pointer<ffi.Pointer<ffi.Void>> pinstance,
    ffi.Pointer<ffi.Void> caller_handle,
  ) {
    return _new_instance(
      pinstance,
      caller_handle,
    );
  }

  late final _new_instancePtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Pointer<ffi.Void>>,
              ffi.Pointer<ffi.Void>)>>('gsapi_new_instance');
  late final _new_instance = _new_instancePtr.asFunction<
      int Function(
          ffi.Pointer<ffi.Pointer<ffi.Void>>, ffi.Pointer<ffi.Void>)>();

  /// WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING
  /// On non-threading capable platforms, Ghostscript supports only
  /// one instance. The current implementation uses a global static
  /// instance counter to make sure that only a single instance is
  /// used.
  /// WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING
  /// /
  /// /* Destroy an instance of Ghostscript
  /// Before you call this, Ghostscript must have finished.
  /// If Ghostscript has been initialised, you must call gsapi_exit()
  /// before gsapi_delete_instance.
  void delete_instance(
    ffi.Pointer<ffi.Void> instance,
  ) {
    return _delete_instance(
      instance,
    );
  }

  late final _delete_instancePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'gsapi_delete_instance');
  late final _delete_instance =
      _delete_instancePtr.asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  /// Set the callback functions for stdio
  /// The stdin callback function should return the number of
  /// characters read, 0 for EOF, or -1 for error.
  /// The stdout and stderr callback functions should return
  /// the number of characters written.
  /// If a callback address is NULL, the real stdio will be used.
  int set_stdio(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<
            ffi.NativeFunction<
                ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle,
                    ffi.Pointer<ffi.Char> buf, ffi.Int len)>>
        stdin_fn,
    ffi.Pointer<
            ffi.NativeFunction<
                ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle,
                    ffi.Pointer<ffi.Char> str, ffi.Int len)>>
        stdout_fn,
    ffi.Pointer<
            ffi.NativeFunction<
                ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle,
                    ffi.Pointer<ffi.Char> str, ffi.Int len)>>
        stderr_fn,
  ) {
    return _set_stdio(
      instance,
      stdin_fn,
      stdout_fn,
      stderr_fn,
    );
  }

  late final _set_stdioPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<
                  ffi.NativeFunction<
                      ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle,
                          ffi.Pointer<ffi.Char> buf, ffi.Int len)>>,
              ffi.Pointer<
                  ffi.NativeFunction<
                      ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle,
                          ffi.Pointer<ffi.Char> str, ffi.Int len)>>,
              ffi.Pointer<
                  ffi.NativeFunction<
                      ffi.Int Function(
                          ffi.Pointer<ffi.Void> caller_handle,
                          ffi.Pointer<ffi.Char> str,
                          ffi.Int len)>>)>>('gsapi_set_stdio');
  late final _set_stdio = _set_stdioPtr.asFunction<
      int Function(
          ffi.Pointer<ffi.Void>,
          ffi.Pointer<
              ffi.NativeFunction<
                  ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle,
                      ffi.Pointer<ffi.Char> buf, ffi.Int len)>>,
          ffi.Pointer<
              ffi.NativeFunction<
                  ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle,
                      ffi.Pointer<ffi.Char> str, ffi.Int len)>>,
          ffi.Pointer<
              ffi.NativeFunction<
                  ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle,
                      ffi.Pointer<ffi.Char> str, ffi.Int len)>>)>();

  /// Does the same as the above, but using the caller_handle given here,
  /// rather than the default one specified at gsapi_new_instance time.
  int set_stdio_with_handle(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<
            ffi.NativeFunction<
                ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle,
                    ffi.Pointer<ffi.Char> buf, ffi.Int len)>>
        stdin_fn,
    ffi.Pointer<
            ffi.NativeFunction<
                ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle,
                    ffi.Pointer<ffi.Char> str, ffi.Int len)>>
        stdout_fn,
    ffi.Pointer<
            ffi.NativeFunction<
                ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle,
                    ffi.Pointer<ffi.Char> str, ffi.Int len)>>
        stderr_fn,
    ffi.Pointer<ffi.Void> caller_handle,
  ) {
    return _set_stdio_with_handle(
      instance,
      stdin_fn,
      stdout_fn,
      stderr_fn,
      caller_handle,
    );
  }

  late final _set_stdio_with_handlePtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<
                  ffi.NativeFunction<
                      ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle,
                          ffi.Pointer<ffi.Char> buf, ffi.Int len)>>,
              ffi.Pointer<
                  ffi.NativeFunction<
                      ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle,
                          ffi.Pointer<ffi.Char> str, ffi.Int len)>>,
              ffi.Pointer<
                  ffi.NativeFunction<
                      ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle,
                          ffi.Pointer<ffi.Char> str, ffi.Int len)>>,
              ffi.Pointer<ffi.Void>)>>('gsapi_set_stdio_with_handle');
  late final _set_stdio_with_handle = _set_stdio_with_handlePtr.asFunction<
      int Function(
          ffi.Pointer<ffi.Void>,
          ffi.Pointer<
              ffi.NativeFunction<
                  ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle,
                      ffi.Pointer<ffi.Char> buf, ffi.Int len)>>,
          ffi.Pointer<
              ffi.NativeFunction<
                  ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle,
                      ffi.Pointer<ffi.Char> str, ffi.Int len)>>,
          ffi.Pointer<
              ffi.NativeFunction<
                  ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle,
                      ffi.Pointer<ffi.Char> str, ffi.Int len)>>,
          ffi.Pointer<ffi.Void>)>();

  /// Set the callback function for polling.
  /// This is used for handling window events or cooperative
  /// multitasking.  This function will only be called if
  /// Ghostscript was compiled with CHECK_INTERRUPTS
  /// as described in gpcheck.h.
  /// The polling function should return 0 if all is well,
  /// and negative if it wants ghostscript to abort.
  /// The polling function must be fast.
  int set_poll(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<
            ffi.NativeFunction<
                ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle)>>
        poll_fn,
  ) {
    return _set_poll(
      instance,
      poll_fn,
    );
  }

  late final _set_pollPtr = _lookup<
          ffi.NativeFunction<
              ffi.Int Function(
                  ffi.Pointer<ffi.Void>,
                  ffi.Pointer<
                      ffi.NativeFunction<
                          ffi.Int Function(
                              ffi.Pointer<ffi.Void> caller_handle)>>)>>(
      'gsapi_set_poll');
  late final _set_poll = _set_pollPtr.asFunction<
      int Function(
          ffi.Pointer<ffi.Void>,
          ffi.Pointer<
              ffi.NativeFunction<
                  ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle)>>)>();

  /// Does the same as the above, but using the caller_handle given here,
  /// rather than the default one specified at gsapi_new_instance time.
  int set_poll_with_handle(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<
            ffi.NativeFunction<
                ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle)>>
        poll_fn,
    ffi.Pointer<ffi.Void> caller_handle,
  ) {
    return _set_poll_with_handle(
      instance,
      poll_fn,
      caller_handle,
    );
  }

  late final _set_poll_with_handlePtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<
                  ffi.NativeFunction<
                      ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle)>>,
              ffi.Pointer<ffi.Void>)>>('gsapi_set_poll_with_handle');
  late final _set_poll_with_handle = _set_poll_with_handlePtr.asFunction<
      int Function(
          ffi.Pointer<ffi.Void>,
          ffi.Pointer<
              ffi.NativeFunction<
                  ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle)>>,
          ffi.Pointer<ffi.Void>)>();

  /// Set the display device callback structure.
  /// If the display device is used, this must be called
  /// after gsapi_new_instance() and before gsapi_init_with_args().
  /// See gdevdisp.h for more details.
  /// DEPRECATED: Use the gsapi_register_callback mechanism instead.
  int set_display_callback(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<display_callback_s> callback,
  ) {
    return _set_display_callback(
      instance,
      callback,
    );
  }

  late final _set_display_callbackPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>,
              ffi.Pointer<display_callback_s>)>>('gsapi_set_display_callback');
  late final _set_display_callback = _set_display_callbackPtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<display_callback_s>)>();

  /// Register a handler for gs callouts.
  /// This must be called after gsapi_new_instance() and (typically)
  /// before gsapi_init_with_args().
  int register_callout(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<
            ffi.NativeFunction<
                ffi.Int Function(
                    ffi.Pointer<ffi.Void>,
                    ffi.Pointer<ffi.Void>,
                    ffi.Pointer<ffi.Char>,
                    ffi.Int,
                    ffi.Int,
                    ffi.Pointer<ffi.Void>)>>
        callout,
    ffi.Pointer<ffi.Void> callout_handle,
  ) {
    return _register_callout(
      instance,
      callout,
      callout_handle,
    );
  }

  late final _register_calloutPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<
                  ffi.NativeFunction<
                      ffi.Int Function(
                          ffi.Pointer<ffi.Void>,
                          ffi.Pointer<ffi.Void>,
                          ffi.Pointer<ffi.Char>,
                          ffi.Int,
                          ffi.Int,
                          ffi.Pointer<ffi.Void>)>>,
              ffi.Pointer<ffi.Void>)>>('gsapi_register_callout');
  late final _register_callout = _register_calloutPtr.asFunction<
      int Function(
          ffi.Pointer<ffi.Void>,
          ffi.Pointer<
              ffi.NativeFunction<
                  ffi.Int Function(
                      ffi.Pointer<ffi.Void>,
                      ffi.Pointer<ffi.Void>,
                      ffi.Pointer<ffi.Char>,
                      ffi.Int,
                      ffi.Int,
                      ffi.Pointer<ffi.Void>)>>,
          ffi.Pointer<ffi.Void>)>();

  /// Deregister a handler for gs callouts.
  void deregister_callout(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<
            ffi.NativeFunction<
                ffi.Int Function(
                    ffi.Pointer<ffi.Void>,
                    ffi.Pointer<ffi.Void>,
                    ffi.Pointer<ffi.Char>,
                    ffi.Int,
                    ffi.Int,
                    ffi.Pointer<ffi.Void>)>>
        callout,
    ffi.Pointer<ffi.Void> callout_handle,
  ) {
    return _deregister_callout(
      instance,
      callout,
      callout_handle,
    );
  }

  late final _deregister_calloutPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<
                  ffi.NativeFunction<
                      ffi.Int Function(
                          ffi.Pointer<ffi.Void>,
                          ffi.Pointer<ffi.Void>,
                          ffi.Pointer<ffi.Char>,
                          ffi.Int,
                          ffi.Int,
                          ffi.Pointer<ffi.Void>)>>,
              ffi.Pointer<ffi.Void>)>>('gsapi_deregister_callout');
  late final _deregister_callout = _deregister_calloutPtr.asFunction<
      void Function(
          ffi.Pointer<ffi.Void>,
          ffi.Pointer<
              ffi.NativeFunction<
                  ffi.Int Function(
                      ffi.Pointer<ffi.Void>,
                      ffi.Pointer<ffi.Void>,
                      ffi.Pointer<ffi.Char>,
                      ffi.Int,
                      ffi.Int,
                      ffi.Pointer<ffi.Void>)>>,
          ffi.Pointer<ffi.Void>)>();

  /// Set the string containing the list of default device names
  /// for example "display x11alpha x11 bbox". Allows the calling
  /// application to influence which device(s) gs will try in order
  /// to select the default device
  ///
  /// *Must* be called after gsapi_new_instance() and before
  /// gsapi_init_with_args().
  int set_default_device_list(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<ffi.Char> list,
    int listlen,
  ) {
    return _set_default_device_list(
      instance,
      list,
      listlen,
    );
  }

  late final _set_default_device_listPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>,
              ffi.Int)>>('gsapi_set_default_device_list');
  late final _set_default_device_list = _set_default_device_listPtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>, int)>();

  /// Returns a pointer to the current default device string
  /// *Must* be called after gsapi_new_instance().
  int get_default_device_list(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<ffi.Pointer<ffi.Char>> list,
    ffi.Pointer<ffi.Int> listlen,
  ) {
    return _get_default_device_list(
      instance,
      list,
      listlen,
    );
  }

  late final _get_default_device_listPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Pointer<ffi.Char>>,
              ffi.Pointer<ffi.Int>)>>('gsapi_get_default_device_list');
  late final _get_default_device_list = _get_default_device_listPtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Pointer<ffi.Char>>,
          ffi.Pointer<ffi.Int>)>();

  /// Set the encoding used for the args. By default we assume
  /// 'local' encoding. For windows this equates to whatever the current
  /// codepage is. For linux this is utf8.
  ///
  /// Use of this API (gsapi) with 'local' encodings (and hence without calling
  /// this function) is now deprecated!
  int set_arg_encoding(
    ffi.Pointer<ffi.Void> instance,
    int encoding,
  ) {
    return _set_arg_encoding(
      instance,
      encoding,
    );
  }

  late final _set_arg_encodingPtr = _lookup<
          ffi.NativeFunction<ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Int)>>(
      'gsapi_set_arg_encoding');
  late final _set_arg_encoding = _set_arg_encodingPtr
      .asFunction<int Function(ffi.Pointer<ffi.Void>, int)>();

  /// Initialise the interpreter.
  /// This calls gs_main_init_with_args() in imainarg.c
  /// 1. If quit or EOF occur during gsapi_init_with_args(),
  /// the return value will be gs_error_Quit.  This is not an error.
  /// You must call gsapi_exit() and must not call any other
  /// gsapi_XXX functions.
  /// 2. If usage info should be displayed, the return value will be gs_error_Info
  /// which is not an error.  Do not call gsapi_exit().
  /// 3. Under normal conditions this returns 0.  You would then
  /// call one or more gsapi_run_*() functions and then finish
  /// with gsapi_exit().
  int init_with_args(
    ffi.Pointer<ffi.Void> instance,
    int argc,
    ffi.Pointer<ffi.Pointer<ffi.Char>> argv,
  ) {
    return _init_with_args(
      instance,
      argc,
      argv,
    );
  }

  late final _init_with_argsPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Int,
              ffi.Pointer<ffi.Pointer<ffi.Char>>)>>('gsapi_init_with_args');
  late final _init_with_args = _init_with_argsPtr.asFunction<
      int Function(
          ffi.Pointer<ffi.Void>, int, ffi.Pointer<ffi.Pointer<ffi.Char>>)>();

  /// The gsapi_run_* functions are like gs_main_run_* except
  /// that the error_object is omitted.
  /// If these functions return <= -100, either quit or a fatal
  /// error has occured.  You then call gsapi_exit() next.
  /// The only exception is gsapi_run_string_continue()
  /// which will return gs_error_NeedInput if all is well.
  int run_string_begin(
    ffi.Pointer<ffi.Void> instance,
    int user_errors,
    ffi.Pointer<ffi.Int> pexit_code,
  ) {
    return _run_string_begin(
      instance,
      user_errors,
      pexit_code,
    );
  }

  late final _run_string_beginPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Int,
              ffi.Pointer<ffi.Int>)>>('gsapi_run_string_begin');
  late final _run_string_begin = _run_string_beginPtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, int, ffi.Pointer<ffi.Int>)>();

  int run_string_continue(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<ffi.Char> str,
    int length,
    int user_errors,
    ffi.Pointer<ffi.Int> pexit_code,
  ) {
    return _run_string_continue(
      instance,
      str,
      length,
      user_errors,
      pexit_code,
    );
  }

  late final _run_string_continuePtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Char>,
              ffi.UnsignedInt,
              ffi.Int,
              ffi.Pointer<ffi.Int>)>>('gsapi_run_string_continue');
  late final _run_string_continue = _run_string_continuePtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>, int, int,
          ffi.Pointer<ffi.Int>)>();

  int run_string_end(
    ffi.Pointer<ffi.Void> instance,
    int user_errors,
    ffi.Pointer<ffi.Int> pexit_code,
  ) {
    return _run_string_end(
      instance,
      user_errors,
      pexit_code,
    );
  }

  late final _run_string_endPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Int,
              ffi.Pointer<ffi.Int>)>>('gsapi_run_string_end');
  late final _run_string_end = _run_string_endPtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, int, ffi.Pointer<ffi.Int>)>();

  int run_string_with_length(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<ffi.Char> str,
    int length,
    int user_errors,
    ffi.Pointer<ffi.Int> pexit_code,
  ) {
    return _run_string_with_length(
      instance,
      str,
      length,
      user_errors,
      pexit_code,
    );
  }

  late final _run_string_with_lengthPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Char>,
              ffi.UnsignedInt,
              ffi.Int,
              ffi.Pointer<ffi.Int>)>>('gsapi_run_string_with_length');
  late final _run_string_with_length = _run_string_with_lengthPtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>, int, int,
          ffi.Pointer<ffi.Int>)>();

  int run_string(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<ffi.Char> str,
    int user_errors,
    ffi.Pointer<ffi.Int> pexit_code,
  ) {
    return _run_string(
      instance,
      str,
      user_errors,
      pexit_code,
    );
  }

  late final _run_stringPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>,
              ffi.Int, ffi.Pointer<ffi.Int>)>>('gsapi_run_string');
  late final _run_string = _run_stringPtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>, int,
          ffi.Pointer<ffi.Int>)>();

  int run_file(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<ffi.Char> file_name,
    int user_errors,
    ffi.Pointer<ffi.Int> pexit_code,
  ) {
    return _run_file(
      instance,
      file_name,
      user_errors,
      pexit_code,
    );
  }

  late final _run_filePtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>,
              ffi.Int, ffi.Pointer<ffi.Int>)>>('gsapi_run_file');
  late final _run_file = _run_filePtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>, int,
          ffi.Pointer<ffi.Int>)>();

  /// Exit the interpreter.
  /// This must be called on shutdown if gsapi_init_with_args()
  /// has been called, and just before gsapi_delete_instance().
  int exit(
    ffi.Pointer<ffi.Void> instance,
  ) {
    return _exit(
      instance,
    );
  }

  late final _exitPtr =
      _lookup<ffi.NativeFunction<ffi.Int Function(ffi.Pointer<ffi.Void>)>>(
          'gsapi_exit');
  late final _exit = _exitPtr.asFunction<int Function(ffi.Pointer<ffi.Void>)>();

  /// gs_spt_parsed allows for a string such as "<< /Foo 0 /Bar true >>" or
  /// "[ 1 2 3 ]" etc to be used so more complex parameters can be set.
  int set_param(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<ffi.Char> param,
    ffi.Pointer<ffi.Void> value,
    int type,
  ) {
    return _set_param(
      instance,
      param,
      value,
      type,
    );
  }

  late final _set_paramPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>,
              ffi.Pointer<ffi.Void>, ffi.Int32)>>('gsapi_set_param');
  late final _set_param = _set_paramPtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>,
          ffi.Pointer<ffi.Void>, int)>();

  /// Called to get a value. value points to storage of the appropriate
  /// type. If value is passed as NULL on entry, then the return code is
  /// the number of bytes storage required for the type. Thus to read a
  /// name/string/parsed value, call once with value=NULL, then obtain
  /// the storage, and call again with value=the storage to get a nul
  /// terminated string. (nul terminator is included in the count - hence
  /// an empty string requires 1 byte storage). Returns gs_error_undefined
  /// (-21) if not found.
  int get_param(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<ffi.Char> param,
    ffi.Pointer<ffi.Void> value,
    int type,
  ) {
    return _get_param(
      instance,
      param,
      value,
      type,
    );
  }

  late final _get_paramPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>,
              ffi.Pointer<ffi.Void>, ffi.Int32)>>('gsapi_get_param');
  late final _get_param = _get_paramPtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>,
          ffi.Pointer<ffi.Void>, int)>();

  /// Enumerator to list all the parameters.
  /// Caller defines void *iter = NULL, and calls with &iter.
  /// Each call, iter is updated to reflect the position within the
  /// enumeration, so passing iterator back in gets the next key. The call
  /// returns negative values for errors, 0 for success, and 1 for "no more
  /// keys".
  ///
  /// void *iter = NULL;
  /// gs_set_param_type type;
  /// const char *key;
  /// int code;
  /// while ((code = gsapi_enumerate_params(inst, &iter, &key, &type)) == 0) {
  /// // Process key
  /// }
  ///
  /// Note that the ordering of enumerations is NOT defined. key is valid
  /// until the next call to gsapi_enumerate_params. Only one enumeration
  /// at a time (starting a new enumeration will invalidate any previous
  /// enumeration).
  int enumerate_params(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<ffi.Pointer<ffi.Void>> iterator,
    ffi.Pointer<ffi.Pointer<ffi.Char>> key,
    ffi.Pointer<ffi.Int32> type,
  ) {
    return _enumerate_params(
      instance,
      iterator,
      key,
      type,
    );
  }

  late final _enumerate_paramsPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Pointer<ffi.Void>>,
              ffi.Pointer<ffi.Pointer<ffi.Char>>,
              ffi.Pointer<ffi.Int32>)>>('gsapi_enumerate_params');
  late final _enumerate_params = _enumerate_paramsPtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Pointer<ffi.Void>>,
          ffi.Pointer<ffi.Pointer<ffi.Char>>, ffi.Pointer<ffi.Int32>)>();

  /// Add a path to one of the sets of permitted paths.
  int add_control_path(
    ffi.Pointer<ffi.Void> instance,
    int type,
    ffi.Pointer<ffi.Char> path,
  ) {
    return _add_control_path(
      instance,
      type,
      path,
    );
  }

  late final _add_control_pathPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Int,
              ffi.Pointer<ffi.Char>)>>('gsapi_add_control_path');
  late final _add_control_path = _add_control_pathPtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, int, ffi.Pointer<ffi.Char>)>();

  /// Remove a path from one of the sets of permitted paths.
  int remove_control_path(
    ffi.Pointer<ffi.Void> instance,
    int type,
    ffi.Pointer<ffi.Char> path,
  ) {
    return _remove_control_path(
      instance,
      type,
      path,
    );
  }

  late final _remove_control_pathPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Int,
              ffi.Pointer<ffi.Char>)>>('gsapi_remove_control_path');
  late final _remove_control_path = _remove_control_pathPtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, int, ffi.Pointer<ffi.Char>)>();

  /// Purge all the paths from the one of the sets of permitted paths.
  void purge_control_paths(
    ffi.Pointer<ffi.Void> instance,
    int type,
  ) {
    return _purge_control_paths(
      instance,
      type,
    );
  }

  late final _purge_control_pathsPtr = _lookup<
          ffi
          .NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int)>>(
      'gsapi_purge_control_paths');
  late final _purge_control_paths = _purge_control_pathsPtr
      .asFunction<void Function(ffi.Pointer<ffi.Void>, int)>();

  void activate_path_control(
    ffi.Pointer<ffi.Void> instance,
    int enable,
  ) {
    return _activate_path_control(
      instance,
      enable,
    );
  }

  late final _activate_path_controlPtr = _lookup<
          ffi
          .NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int)>>(
      'gsapi_activate_path_control');
  late final _activate_path_control = _activate_path_controlPtr
      .asFunction<void Function(ffi.Pointer<ffi.Void>, int)>();

  int is_path_control_active(
    ffi.Pointer<ffi.Void> instance,
  ) {
    return _is_path_control_active(
      instance,
    );
  }

  late final _is_path_control_activePtr =
      _lookup<ffi.NativeFunction<ffi.Int Function(ffi.Pointer<ffi.Void>)>>(
          'gsapi_is_path_control_active');
  late final _is_path_control_active = _is_path_control_activePtr
      .asFunction<int Function(ffi.Pointer<ffi.Void>)>();

  int add_fs(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<gsapi_fs_t> fs,
    ffi.Pointer<ffi.Void> secret,
  ) {
    return _add_fs(
      instance,
      fs,
      secret,
    );
  }

  late final _add_fsPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<gsapi_fs_t>,
              ffi.Pointer<ffi.Void>)>>('gsapi_add_fs');
  late final _add_fs = _add_fsPtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<gsapi_fs_t>,
          ffi.Pointer<ffi.Void>)>();

  void remove_fs(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<gsapi_fs_t> fs,
    ffi.Pointer<ffi.Void> secret,
  ) {
    return _remove_fs(
      instance,
      fs,
      secret,
    );
  }

  late final _remove_fsPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<gsapi_fs_t>,
              ffi.Pointer<ffi.Void>)>>('gsapi_remove_fs');
  late final _remove_fs = _remove_fsPtr.asFunction<
      void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<gsapi_fs_t>,
          ffi.Pointer<ffi.Void>)>();

  int gsdart_revision(
    ffi.Pointer<gsapi_revision_s> pr,
    int len,
  ) {
    return _gsdart_revision(
      pr,
      len,
    );
  }

  late final _gsdart_revisionPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(
              ffi.Pointer<gsapi_revision_s>, ffi.Int)>>('gsdart_revision');
  late final _gsdart_revision = _gsdart_revisionPtr
      .asFunction<int Function(ffi.Pointer<gsapi_revision_s>, int)>();

  int gsdart_new_instance() {
    return _gsdart_new_instance();
  }

  late final _gsdart_new_instancePtr =
      _lookup<ffi.NativeFunction<ffi.Int Function()>>('gsdart_new_instance');
  late final _gsdart_new_instance =
      _gsdart_new_instancePtr.asFunction<int Function()>();

  int gsdart_set_arg_encoding(
    int encoding,
  ) {
    return _gsdart_set_arg_encoding(
      encoding,
    );
  }

  late final _gsdart_set_arg_encodingPtr =
      _lookup<ffi.NativeFunction<ffi.Int Function(ffi.Int)>>(
          'gsdart_set_arg_encoding');
  late final _gsdart_set_arg_encoding =
      _gsdart_set_arg_encodingPtr.asFunction<int Function(int)>();

  int gsdart_init_with_args(
    int argc,
    ffi.Pointer<ffi.Pointer<ffi.Char>> argv,
  ) {
    return _gsdart_init_with_args(
      argc,
      argv,
    );
  }

  late final _gsdart_init_with_argsPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Int,
              ffi.Pointer<ffi.Pointer<ffi.Char>>)>>('gsdart_init_with_args');
  late final _gsdart_init_with_args = _gsdart_init_with_argsPtr
      .asFunction<int Function(int, ffi.Pointer<ffi.Pointer<ffi.Char>>)>();

  int gsdart_exit() {
    return _gsdart_exit();
  }

  late final _gsdart_exitPtr =
      _lookup<ffi.NativeFunction<ffi.Int Function()>>('gsdart_exit');
  late final _gsdart_exit = _gsdart_exitPtr.asFunction<int Function()>();

  void gsdart_delete_instance() {
    return _gsdart_delete_instance();
  }

  late final _gsdart_delete_instancePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function()>>(
          'gsdart_delete_instance');
  late final _gsdart_delete_instance =
      _gsdart_delete_instancePtr.asFunction<void Function()>();
}

final class gsapi_revision_s extends ffi.Struct {
  external ffi.Pointer<ffi.Char> product;

  external ffi.Pointer<ffi.Char> copyright;

  @ffi.Long()
  external int revision;

  @ffi.Long()
  external int revisiondate;
}

final class display_callback_s extends ffi.Opaque {}

abstract class gs_set_param_type {
  static const int gs_spt_invalid = -1;

  /// void * is NULL
  static const int gs_spt_null = 0;

  /// void * is a pointer to an int (0 false,
  /// non-zero true).
  static const int gs_spt_bool = 1;

  /// void * is a pointer to an int
  static const int gs_spt_int = 2;

  /// void * is a float *
  static const int gs_spt_float = 3;

  /// void * is a char *
  static const int gs_spt_name = 4;

  /// void * is a char *
  static const int gs_spt_string = 5;

  /// void * is a long *
  static const int gs_spt_long = 6;

  /// void * is an int64_t *
  static const int gs_spt_i64 = 7;

  /// void * is a size_t *
  static const int gs_spt_size_t = 8;

  /// void * is a pointer to a char * to be parsed
  static const int gs_spt_parsed = 9;

  /// Setting a typed param causes it to be instantly fed to to the
  /// device. This can cause the device to reinitialise itself. Hence,
  /// setting a sequence of typed params can cause the device to reset
  /// itself several times. Accordingly, if you OR the type with
  /// gs_spt_more_to_come, the param will held ready to be passed into
  /// the device, and will only actually be sent when the next typed
  /// param is set without this flag (or on device init). Not valid
  /// for get_typed_param.
  static const int gs_spt_more_to_come = -2147483648;
}

final class gsapi_fs_t extends ffi.Struct {
  external ffi.Pointer<
      ffi.NativeFunction<
          ffi.Int Function(
              ffi.Pointer<gs_memory_s> mem,
              ffi.Pointer<ffi.Void> secret,
              ffi.Pointer<ffi.Char> fname,
              ffi.Pointer<ffi.Char> mode,
              ffi.Pointer<ffi.Pointer<gp_file_s>> file)>> open_file;

  external ffi.Pointer<
      ffi.NativeFunction<
          ffi.Int Function(
              ffi.Pointer<gs_memory_s> mem,
              ffi.Pointer<ffi.Void> secret,
              ffi.Pointer<ffi.Char> fname,
              ffi.Pointer<ffi.Char> rfname,
              ffi.Pointer<ffi.Char> mode,
              ffi.Pointer<ffi.Pointer<gp_file_s>> file)>> open_pipe;

  external ffi.Pointer<
      ffi.NativeFunction<
          ffi.Int Function(
              ffi.Pointer<gs_memory_s> mem,
              ffi.Pointer<ffi.Void> secret,
              ffi.Pointer<ffi.Char> prefix,
              ffi.Pointer<ffi.Char> rfname,
              ffi.Pointer<ffi.Char> mode,
              ffi.Int rm,
              ffi.Pointer<ffi.Pointer<gp_file_s>> file)>> open_scratch;

  external ffi.Pointer<
      ffi.NativeFunction<
          ffi.Int Function(
              ffi.Pointer<gs_memory_s> mem,
              ffi.Pointer<ffi.Void> secret,
              ffi.Pointer<ffi.Char> fname,
              ffi.Int binary,
              ffi.Pointer<ffi.Pointer<gp_file_s>> file)>> open_printer;

  external ffi.Pointer<
      ffi.NativeFunction<
          ffi.Int Function(
              ffi.Pointer<gs_memory_s> mem,
              ffi.Pointer<ffi.Void> secret,
              ffi.Pointer<ffi.Char> fname,
              ffi.Pointer<ffi.Char> mode,
              ffi.Pointer<ffi.Pointer<gp_file_s>> file)>> open_handle;
}

final class gs_memory_s extends ffi.Opaque {}

final class gp_file_s extends ffi.Opaque {}

const int GS_ARG_ENCODING_LOCAL = 0;

const int GS_ARG_ENCODING_UTF8 = 1;

const int GS_ARG_ENCODING_UTF16LE = 2;

const int GS_PERMIT_FILE_READING = 0;

const int GS_PERMIT_FILE_WRITING = 1;

const int GS_PERMIT_FILE_CONTROL = 2;
