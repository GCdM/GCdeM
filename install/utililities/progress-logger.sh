# Is it possible to create a higher-level function that takes
# a `description` and `icon` and returns a "logger", The logger would
# then takes `process`, `status`, and `message` arguments to
# consistently format logs across all steps?
#
# - `module_icon` - represents install module
# - `module_description` - text description for module
#
# - `process` - an enum for processes to standardise steps e.g. installing, updating, configuring
# - `status` - an enum to standardise status e.g. success, fail, skipped, etc...
# - `message` - human readable message to explain step
