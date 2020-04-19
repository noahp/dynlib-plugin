
# Multiple plugin names for the example, eg:
# PLUGIN_NAMES='one two three four' make test
PLUGIN_NAMES ?= plugin-1

# The main application
plugin-loading: main.c
	$(CC) $(CFLAGS) -rdynamic $^ -ldl -o $@

# The plugins. Insert the name of the plugin via -DPLUGIN_NAME define
$(PLUGIN_NAMES:%=%.so): plugin.c
	$(CC) $(CFLAGS) -shared -rdynamic -DPLUGIN_NAME=$(basename $@) $^ -o $@

# Test loading the plugins by running the main app with the plugins as args
.PHONY: test
test: plugin-loading $(PLUGIN_NAMES:%=%.so)
	./plugin-loading $(PLUGIN_NAMES:%=./%.so)

# Test the same, but with a rust dynlib
rust/target/release/librust.so:
	cd rust && cargo build --release

.PHONY: test-rust
test-rust: plugin-loading rust/target/release/librust.so
	./plugin-loading rust/target/release/librust.so

# Demonstrate loading rust + c dynlib plugins
.PHONY: test-mixed
test-mixed: plugin-loading rust/target/release/librust.so $(PLUGIN_NAMES:%=%.so)
	./plugin-loading rust/target/release/librust.so $(PLUGIN_NAMES:%=./%.so)
