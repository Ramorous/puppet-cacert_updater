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
  $yaml_info         = undef,
  $yaml_file         = 'cacert_updater.yaml',
) {
  if $class_enabled == true {
    $var_hash = parseyaml($yaml_info)
    if ! $var_hash {
      $new_hash = loadyaml($yaml_file)
    } else {
      $new_hash = $var_hash
    }
    notice("${new_hash}")
  } else {
    notice('Class not enabled')
  }
}
