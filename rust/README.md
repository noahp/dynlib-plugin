# 🦀 rust dynlib plugin example

This uses bindgen and ctor to create a shared lib plugin .so that can be loaded
with dlopen, calling into the c API `plugin_lib_register` as declared in
`plugin_lib.h` and defined in the main app `main.c`.
