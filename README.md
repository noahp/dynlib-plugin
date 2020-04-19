# 🧩 dynlib-plugin

Small example of using [`dlopen`](https://linux.die.net/man/3/dlopen) to
register plugin data into an application.

Just playing with how this can be used to enable native plugin functionality to
programs like eg gdb:
> https://www.gnu.org/software/gdb/papers/libgdb/libgdb.html

Which don't necessarily have a purpose-built native plugin infrastructure.

The example can be run by:

```bash
# use the `test-mixed` to build c and rust dynlib plugins, and the main app,
# and run the main app loading the plugins
❯ make test-mixed
./plugin-loading rust/target/release/librust.so ./plugin-1.so
Registering '🦀 hello from rust! 🦀'
Registering '🦄 hello from C plugin-1 🦄'
```
