
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
