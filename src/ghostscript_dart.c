#include "ghostscript_dart.h"

void *gsinst = NULL;

FFI_PLUGIN_EXPORT int gsdart_revision(gsapi_revision_t *pr, int len)
{
  return gsapi_revision(pr, len);
}

FFI_PLUGIN_EXPORT int gsdart_new_instance()
{
  if (gsinst != NULL)
    return 0;
  return gsapi_new_instance(&gsinst, NULL);
}

FFI_PLUGIN_EXPORT int gsdart_set_arg_encoding(int encoding)
{
  return gsapi_set_arg_encoding(gsinst, encoding);
}

FFI_PLUGIN_EXPORT int gsdart_init_with_args(int argc, char **argv)
{
  printf("argc=%i\n", argc);
  for (int i = 0; i < argc; ++i)
  {
    printf("String %i @ %p: %s\n", i, &argv[i][0], argv[i]);
  }
  return gsapi_init_with_args(gsinst, argc, argv);
}

FFI_PLUGIN_EXPORT int gsdart_exit()
{
  return gsapi_exit(gsinst);
}

FFI_PLUGIN_EXPORT void gsdart_delete_instance()
{
  gsapi_delete_instance(gsinst);
  gsinst = NULL;
}
