# Class: cacert_updater
#
# This module will allow you to update server CA Trusts with CA Certificates provided in YAML format.
# Details are found below as to the format of the YAML configuration.
#
# Parameters:
#   class_enabled  (Boolean: default [true])
#     - Enables/Disables the process
#
class cacert_updater (
  $class_enabled     = true,
  $yaml_info         = '',
) {
}
