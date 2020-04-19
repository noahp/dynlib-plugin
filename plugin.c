#include "plugin_lib.h"

//! C preproccesor monkeying to convert arg to stringified "arg"
//! https://gcc.gnu.org/onlinedocs/gcc-9.3.0/cpp/Stringizing.html
#define xstr(s) str(s)
#define str(s) #s

//! This function is called when the lib is loaded via dlopen
void __attribute__((constructor)) entrance_point(void) {
  plugin_lib_register("🦄 hello from " xstr(PLUGIN_NAME) " 🦄");
}
