# SHPS4Node-GUI

GUI for SHPS4Node

This GUI will be developed like any normal application on SHPS, so it can be installed on any SHPS instance or removed just by copying files over.

With the help of a plugin, the GUI will be able to manage all installed applications/websites, plugins, etc. The plugin will also serve as feature-shim for all needed features which are not present in older versions (like WebSocket support)

The GUI will be a mere display and action-proxy to the plugin, which will execute whatever is requested. The GUI plugin will follow the architecture specified [here](https://hashnode.com/post/decoupling-nodejs-monster-files-cisisw8kf00sbam535k8hmpou).
