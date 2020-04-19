#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>

#include "plugin_lib.h"

//! This function can be called by plugins
void plugin_lib_register(const char *name) {
  printf("Registering '%s'\n", name);
}

//! Run dlopen on the passed `plugin_so` path. dlopen will run the constructor
//! in the plugin, which can call into plugin_lib_register to communicate with
//! this application
static int load_plugin(const char *plugin_so) {
  void *handle = dlopen(plugin_so, RTLD_LAZY);
  if (!handle) {
    fprintf(stderr, "%s\n", dlerror());
    return EXIT_FAILURE;
  }

  return 0;
}

int main(int argc, char **argv) {
  // Load all plugins listed as args
  for (size_t i = 1; i < argc; i++) {
    int retval = load_plugin(argv[i]);
    if (retval) {
      return retval;
    }
  }

  return 0;
}
