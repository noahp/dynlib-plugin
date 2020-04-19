# 🧩 dl-plugin

Small example of using [`dlopen`](https://linux.die.net/man/3/dlopen) to
register plugin data into an application.

Just playing with how this can be used to enable native plugin functionality to
programs like eg gdb:
> https://www.gnu.org/software/gdb/papers/libgdb/libgdb.html

Which don't necessarily have a purpose-built native plugin infrastructure.

The example can be run by:

```bash
# use the `test` rule to build example plugins and run the main app, loading
# them
❯ PLUGIN_NAMES='one two three four' make test
cc  -rdynamic main.c -ldl -o plugin-loading
cc  -shared -rdynamic -DPLUGIN_NAME=one plugin.c -o one.so
cc  -shared -rdynamic -DPLUGIN_NAME=two plugin.c -o two.so
cc  -shared -rdynamic -DPLUGIN_NAME=three plugin.c -o three.so
cc  -shared -rdynamic -DPLUGIN_NAME=four plugin.c -o four.so
./plugin-loading ./one.so ./two.so ./three.so ./four.so
Registering '🦄 hello from one 🦄'
Registering '🦄 hello from two 🦄'
Registering '🦄 hello from three 🦄'
Registering '🦄 hello from four 🦄'
```
