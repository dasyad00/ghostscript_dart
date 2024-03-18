#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include "iapi.h"

#if _WIN32
#include <windows.h>
#else
#include <pthread.h>
#include <unistd.h>
#endif

#if _WIN32
#define FFI_PLUGIN_EXPORT __declspec(dllexport)
#else
#define FFI_PLUGIN_EXPORT
#endif

FFI_PLUGIN_EXPORT int gsdart_revision(gsapi_revision_t *pr, int len);
FFI_PLUGIN_EXPORT int gsdart_new_instance();
FFI_PLUGIN_EXPORT int gsdart_set_arg_encoding(int encoding);
FFI_PLUGIN_EXPORT int gsdart_init_with_args(int argc, char **argv);
FFI_PLUGIN_EXPORT int gsdart_exit();
FFI_PLUGIN_EXPORT void gsdart_delete_instance();
