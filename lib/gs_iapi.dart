// ignore_for_file: camel_case_types, non_constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
// ignore_for_file: type=lint
import 'dart:ffi' as ffi;

/// Auto-generated Dart bindings for GhostScript
class GhostScriptDartBindings {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  GhostScriptDartBindings(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  GhostScriptDartBindings.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  int gsapi_revision(
    ffi.Pointer<gsapi_revision_s> pr,
    int len,
  ) {
    return _gsapi_revision(
      pr,
      len,
    );
  }

  late final _gsapi_revisionPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(
              ffi.Pointer<gsapi_revision_s>, ffi.Int)>>('gsapi_revision');
  late final _gsapi_revision = _gsapi_revisionPtr
      .asFunction<int Function(ffi.Pointer<gsapi_revision_s>, int)>();

  int gsapi_new_instance(
    ffi.Pointer<ffi.Pointer<ffi.Void>> pinstance,
    ffi.Pointer<ffi.Void> caller_handle,
  ) {
    return _gsapi_new_instance(
      pinstance,
      caller_handle,
    );
  }

  late final _gsapi_new_instancePtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Pointer<ffi.Void>>,
              ffi.Pointer<ffi.Void>)>>('gsapi_new_instance');
  late final _gsapi_new_instance = _gsapi_new_instancePtr.asFunction<
      int Function(
          ffi.Pointer<ffi.Pointer<ffi.Void>>, ffi.Pointer<ffi.Void>)>();

  void gsapi_delete_instance(
    ffi.Pointer<ffi.Void> instance,
  ) {
    return _gsapi_delete_instance(
      instance,
    );
  }

  late final _gsapi_delete_instancePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'gsapi_delete_instance');
  late final _gsapi_delete_instance = _gsapi_delete_instancePtr
      .asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  int gsapi_set_stdio(
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
    return _gsapi_set_stdio(
      instance,
      stdin_fn,
      stdout_fn,
      stderr_fn,
    );
  }

  late final _gsapi_set_stdioPtr = _lookup<
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
  late final _gsapi_set_stdio = _gsapi_set_stdioPtr.asFunction<
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

  int gsapi_set_stdio_with_handle(
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
    return _gsapi_set_stdio_with_handle(
      instance,
      stdin_fn,
      stdout_fn,
      stderr_fn,
      caller_handle,
    );
  }

  late final _gsapi_set_stdio_with_handlePtr = _lookup<
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
  late final _gsapi_set_stdio_with_handle =
      _gsapi_set_stdio_with_handlePtr.asFunction<
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

  int gsapi_set_poll(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<
            ffi.NativeFunction<
                ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle)>>
        poll_fn,
  ) {
    return _gsapi_set_poll(
      instance,
      poll_fn,
    );
  }

  late final _gsapi_set_pollPtr = _lookup<
          ffi.NativeFunction<
              ffi.Int Function(
                  ffi.Pointer<ffi.Void>,
                  ffi.Pointer<
                      ffi.NativeFunction<
                          ffi.Int Function(
                              ffi.Pointer<ffi.Void> caller_handle)>>)>>(
      'gsapi_set_poll');
  late final _gsapi_set_poll = _gsapi_set_pollPtr.asFunction<
      int Function(
          ffi.Pointer<ffi.Void>,
          ffi.Pointer<
              ffi.NativeFunction<
                  ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle)>>)>();

  int gsapi_set_poll_with_handle(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<
            ffi.NativeFunction<
                ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle)>>
        poll_fn,
    ffi.Pointer<ffi.Void> caller_handle,
  ) {
    return _gsapi_set_poll_with_handle(
      instance,
      poll_fn,
      caller_handle,
    );
  }

  late final _gsapi_set_poll_with_handlePtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<
                  ffi.NativeFunction<
                      ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle)>>,
              ffi.Pointer<ffi.Void>)>>('gsapi_set_poll_with_handle');
  late final _gsapi_set_poll_with_handle =
      _gsapi_set_poll_with_handlePtr.asFunction<
          int Function(
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<
                  ffi.NativeFunction<
                      ffi.Int Function(ffi.Pointer<ffi.Void> caller_handle)>>,
              ffi.Pointer<ffi.Void>)>();

  int gsapi_set_display_callback(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<display_callback_s> callback,
  ) {
    return _gsapi_set_display_callback(
      instance,
      callback,
    );
  }

  late final _gsapi_set_display_callbackPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>,
              ffi.Pointer<display_callback_s>)>>('gsapi_set_display_callback');
  late final _gsapi_set_display_callback =
      _gsapi_set_display_callbackPtr.asFunction<
          int Function(
              ffi.Pointer<ffi.Void>, ffi.Pointer<display_callback_s>)>();

  int gsapi_register_callout(
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
    return _gsapi_register_callout(
      instance,
      callout,
      callout_handle,
    );
  }

  late final _gsapi_register_calloutPtr = _lookup<
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
  late final _gsapi_register_callout = _gsapi_register_calloutPtr.asFunction<
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

  void gsapi_deregister_callout(
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
    return _gsapi_deregister_callout(
      instance,
      callout,
      callout_handle,
    );
  }

  late final _gsapi_deregister_calloutPtr = _lookup<
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
  late final _gsapi_deregister_callout =
      _gsapi_deregister_calloutPtr.asFunction<
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

  int gsapi_set_default_device_list(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<ffi.Char> list,
    int listlen,
  ) {
    return _gsapi_set_default_device_list(
      instance,
      list,
      listlen,
    );
  }

  late final _gsapi_set_default_device_listPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>,
              ffi.Int)>>('gsapi_set_default_device_list');
  late final _gsapi_set_default_device_list =
      _gsapi_set_default_device_listPtr.asFunction<
          int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>, int)>();

  int gsapi_get_default_device_list(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<ffi.Pointer<ffi.Char>> list,
    ffi.Pointer<ffi.Int> listlen,
  ) {
    return _gsapi_get_default_device_list(
      instance,
      list,
      listlen,
    );
  }

  late final _gsapi_get_default_device_listPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Pointer<ffi.Char>>,
              ffi.Pointer<ffi.Int>)>>('gsapi_get_default_device_list');
  late final _gsapi_get_default_device_list =
      _gsapi_get_default_device_listPtr.asFunction<
          int Function(ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Pointer<ffi.Char>>, ffi.Pointer<ffi.Int>)>();

  int gsapi_set_arg_encoding(
    ffi.Pointer<ffi.Void> instance,
    int encoding,
  ) {
    return _gsapi_set_arg_encoding(
      instance,
      encoding,
    );
  }

  late final _gsapi_set_arg_encodingPtr = _lookup<
          ffi.NativeFunction<ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Int)>>(
      'gsapi_set_arg_encoding');
  late final _gsapi_set_arg_encoding = _gsapi_set_arg_encodingPtr
      .asFunction<int Function(ffi.Pointer<ffi.Void>, int)>();

  int gsapi_init_with_args(
    ffi.Pointer<ffi.Void> instance,
    int argc,
    ffi.Pointer<ffi.Pointer<ffi.Char>> argv,
  ) {
    return _gsapi_init_with_args(
      instance,
      argc,
      argv,
    );
  }

  late final _gsapi_init_with_argsPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Int,
              ffi.Pointer<ffi.Pointer<ffi.Char>>)>>('gsapi_init_with_args');
  late final _gsapi_init_with_args = _gsapi_init_with_argsPtr.asFunction<
      int Function(
          ffi.Pointer<ffi.Void>, int, ffi.Pointer<ffi.Pointer<ffi.Char>>)>();

  int gsapi_run_string_begin(
    ffi.Pointer<ffi.Void> instance,
    int user_errors,
    ffi.Pointer<ffi.Int> pexit_code,
  ) {
    return _gsapi_run_string_begin(
      instance,
      user_errors,
      pexit_code,
    );
  }

  late final _gsapi_run_string_beginPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Int,
              ffi.Pointer<ffi.Int>)>>('gsapi_run_string_begin');
  late final _gsapi_run_string_begin = _gsapi_run_string_beginPtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, int, ffi.Pointer<ffi.Int>)>();

  int gsapi_run_string_continue(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<ffi.Char> str,
    int length,
    int user_errors,
    ffi.Pointer<ffi.Int> pexit_code,
  ) {
    return _gsapi_run_string_continue(
      instance,
      str,
      length,
      user_errors,
      pexit_code,
    );
  }

  late final _gsapi_run_string_continuePtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Char>,
              ffi.UnsignedInt,
              ffi.Int,
              ffi.Pointer<ffi.Int>)>>('gsapi_run_string_continue');
  late final _gsapi_run_string_continue =
      _gsapi_run_string_continuePtr.asFunction<
          int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>, int, int,
              ffi.Pointer<ffi.Int>)>();

  int gsapi_run_string_end(
    ffi.Pointer<ffi.Void> instance,
    int user_errors,
    ffi.Pointer<ffi.Int> pexit_code,
  ) {
    return _gsapi_run_string_end(
      instance,
      user_errors,
      pexit_code,
    );
  }

  late final _gsapi_run_string_endPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Int,
              ffi.Pointer<ffi.Int>)>>('gsapi_run_string_end');
  late final _gsapi_run_string_end = _gsapi_run_string_endPtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, int, ffi.Pointer<ffi.Int>)>();

  int gsapi_run_string_with_length(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<ffi.Char> str,
    int length,
    int user_errors,
    ffi.Pointer<ffi.Int> pexit_code,
  ) {
    return _gsapi_run_string_with_length(
      instance,
      str,
      length,
      user_errors,
      pexit_code,
    );
  }

  late final _gsapi_run_string_with_lengthPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Char>,
              ffi.UnsignedInt,
              ffi.Int,
              ffi.Pointer<ffi.Int>)>>('gsapi_run_string_with_length');
  late final _gsapi_run_string_with_length =
      _gsapi_run_string_with_lengthPtr.asFunction<
          int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>, int, int,
              ffi.Pointer<ffi.Int>)>();

  int gsapi_run_string(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<ffi.Char> str,
    int user_errors,
    ffi.Pointer<ffi.Int> pexit_code,
  ) {
    return _gsapi_run_string(
      instance,
      str,
      user_errors,
      pexit_code,
    );
  }

  late final _gsapi_run_stringPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>,
              ffi.Int, ffi.Pointer<ffi.Int>)>>('gsapi_run_string');
  late final _gsapi_run_string = _gsapi_run_stringPtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>, int,
          ffi.Pointer<ffi.Int>)>();

  int gsapi_run_file(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<ffi.Char> file_name,
    int user_errors,
    ffi.Pointer<ffi.Int> pexit_code,
  ) {
    return _gsapi_run_file(
      instance,
      file_name,
      user_errors,
      pexit_code,
    );
  }

  late final _gsapi_run_filePtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>,
              ffi.Int, ffi.Pointer<ffi.Int>)>>('gsapi_run_file');
  late final _gsapi_run_file = _gsapi_run_filePtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>, int,
          ffi.Pointer<ffi.Int>)>();

  int gsapi_exit(
    ffi.Pointer<ffi.Void> instance,
  ) {
    return _gsapi_exit(
      instance,
    );
  }

  late final _gsapi_exitPtr =
      _lookup<ffi.NativeFunction<ffi.Int Function(ffi.Pointer<ffi.Void>)>>(
          'gsapi_exit');
  late final _gsapi_exit =
      _gsapi_exitPtr.asFunction<int Function(ffi.Pointer<ffi.Void>)>();

  int gsapi_set_param(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<ffi.Char> param,
    ffi.Pointer<ffi.Void> value,
    int type,
  ) {
    return _gsapi_set_param(
      instance,
      param,
      value,
      type,
    );
  }

  late final _gsapi_set_paramPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>,
              ffi.Pointer<ffi.Void>, ffi.Int32)>>('gsapi_set_param');
  late final _gsapi_set_param = _gsapi_set_paramPtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>,
          ffi.Pointer<ffi.Void>, int)>();

  int gsapi_get_param(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<ffi.Char> param,
    ffi.Pointer<ffi.Void> value,
    int type,
  ) {
    return _gsapi_get_param(
      instance,
      param,
      value,
      type,
    );
  }

  late final _gsapi_get_paramPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>,
              ffi.Pointer<ffi.Void>, ffi.Int32)>>('gsapi_get_param');
  late final _gsapi_get_param = _gsapi_get_paramPtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>,
          ffi.Pointer<ffi.Void>, int)>();

  int gsapi_enumerate_params(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<ffi.Pointer<ffi.Void>> iterator,
    ffi.Pointer<ffi.Pointer<ffi.Char>> key,
    ffi.Pointer<ffi.Int32> type,
  ) {
    return _gsapi_enumerate_params(
      instance,
      iterator,
      key,
      type,
    );
  }

  late final _gsapi_enumerate_paramsPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Pointer<ffi.Void>>,
              ffi.Pointer<ffi.Pointer<ffi.Char>>,
              ffi.Pointer<ffi.Int32>)>>('gsapi_enumerate_params');
  late final _gsapi_enumerate_params = _gsapi_enumerate_paramsPtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Pointer<ffi.Void>>,
          ffi.Pointer<ffi.Pointer<ffi.Char>>, ffi.Pointer<ffi.Int32>)>();

  int gsapi_add_control_path(
    ffi.Pointer<ffi.Void> instance,
    int type,
    ffi.Pointer<ffi.Char> path,
  ) {
    return _gsapi_add_control_path(
      instance,
      type,
      path,
    );
  }

  late final _gsapi_add_control_pathPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Int,
              ffi.Pointer<ffi.Char>)>>('gsapi_add_control_path');
  late final _gsapi_add_control_path = _gsapi_add_control_pathPtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, int, ffi.Pointer<ffi.Char>)>();

  int gsapi_remove_control_path(
    ffi.Pointer<ffi.Void> instance,
    int type,
    ffi.Pointer<ffi.Char> path,
  ) {
    return _gsapi_remove_control_path(
      instance,
      type,
      path,
    );
  }

  late final _gsapi_remove_control_pathPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Int,
              ffi.Pointer<ffi.Char>)>>('gsapi_remove_control_path');
  late final _gsapi_remove_control_path =
      _gsapi_remove_control_pathPtr.asFunction<
          int Function(ffi.Pointer<ffi.Void>, int, ffi.Pointer<ffi.Char>)>();

  void gsapi_purge_control_paths(
    ffi.Pointer<ffi.Void> instance,
    int type,
  ) {
    return _gsapi_purge_control_paths(
      instance,
      type,
    );
  }

  late final _gsapi_purge_control_pathsPtr = _lookup<
          ffi
          .NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int)>>(
      'gsapi_purge_control_paths');
  late final _gsapi_purge_control_paths = _gsapi_purge_control_pathsPtr
      .asFunction<void Function(ffi.Pointer<ffi.Void>, int)>();

  void gsapi_activate_path_control(
    ffi.Pointer<ffi.Void> instance,
    int enable,
  ) {
    return _gsapi_activate_path_control(
      instance,
      enable,
    );
  }

  late final _gsapi_activate_path_controlPtr = _lookup<
          ffi
          .NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int)>>(
      'gsapi_activate_path_control');
  late final _gsapi_activate_path_control = _gsapi_activate_path_controlPtr
      .asFunction<void Function(ffi.Pointer<ffi.Void>, int)>();

  int gsapi_is_path_control_active(
    ffi.Pointer<ffi.Void> instance,
  ) {
    return _gsapi_is_path_control_active(
      instance,
    );
  }

  late final _gsapi_is_path_control_activePtr =
      _lookup<ffi.NativeFunction<ffi.Int Function(ffi.Pointer<ffi.Void>)>>(
          'gsapi_is_path_control_active');
  late final _gsapi_is_path_control_active = _gsapi_is_path_control_activePtr
      .asFunction<int Function(ffi.Pointer<ffi.Void>)>();

  int gsapi_add_fs(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<gsapi_fs_t> fs,
    ffi.Pointer<ffi.Void> secret,
  ) {
    return _gsapi_add_fs(
      instance,
      fs,
      secret,
    );
  }

  late final _gsapi_add_fsPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<gsapi_fs_t>,
              ffi.Pointer<ffi.Void>)>>('gsapi_add_fs');
  late final _gsapi_add_fs = _gsapi_add_fsPtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, ffi.Pointer<gsapi_fs_t>,
          ffi.Pointer<ffi.Void>)>();

  void gsapi_remove_fs(
    ffi.Pointer<ffi.Void> instance,
    ffi.Pointer<gsapi_fs_t> fs,
    ffi.Pointer<ffi.Void> secret,
  ) {
    return _gsapi_remove_fs(
      instance,
      fs,
      secret,
    );
  }

  late final _gsapi_remove_fsPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<gsapi_fs_t>,
              ffi.Pointer<ffi.Void>)>>('gsapi_remove_fs');
  late final _gsapi_remove_fs = _gsapi_remove_fsPtr.asFunction<
      void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<gsapi_fs_t>,
          ffi.Pointer<ffi.Void>)>();
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
  static const int gs_spt_null = 0;
  static const int gs_spt_bool = 1;
  static const int gs_spt_int = 2;
  static const int gs_spt_float = 3;
  static const int gs_spt_name = 4;
  static const int gs_spt_string = 5;
  static const int gs_spt_long = 6;
  static const int gs_spt_i64 = 7;
  static const int gs_spt_size_t = 8;
  static const int gs_spt_parsed = 9;
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
