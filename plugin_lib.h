//! Example library header that defines the interface between the plugin and the
//! main application

//! This function should be called by the plugin code.
//!
//! It would be called from the function in the plugin marked with
//! `__attribute__((constructor))`, to eg register plugin functions. For this
//! example, it just prints a string.
void plugin_lib_register(const char *name);
