# cacert_updater

####Table of Contents
1. [Overview](#overview)
2. [Module Description - What the this module does and why it is useful](#module-description)
3. [Setup - The basics of getting started](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with CA Cert Updater](#beginning-with-run-once)
4. [License](#license)

##Overview

Import CA Certificates and update trusts.

##Module Description

This module will allow you to update server CA Trusts with CA Certificates provided in YAML format. Details are found below as to the format of the YAML configuration.

This module was tested and works within RedHat Satellite 6.1.

##Setup

##Setup Requirements

Make sure touch is within the path /usr/bin or /sbin

The default command_var variable is set to "/sbin/shutdown -ra now" which will reboot your server. The intended purpose of this was originally to allow scheduled reboots, but I modified it to do more.

##Beginning with run once

```puppet
    cacert_updater {
      "class_enabled" => true,
      "yaml_info" => "certificates: 
        - 
          local_file: /etc/pki/ca-trust/source/anchors
          name: entrust_g2_ca.cer
          remote_file: "https://www.entrust.com/root-certificates/entrust_g2_ca.cer"
        - 
          local_file: /etc/pki/ca-trust/source/anchors
          name: entrust_l1k.cer
          remote_file: "https://www.entrust.com/root-certificates/entrust_l1k.cer"
      commands: 
        -
          operating_system: RedHat
          post_run: "update-ca-trust extract"
          pre_run: "update-ca-trust enable"
        -
      "
    }
```

    class_enabled  (Boolean: default [true])
    - Enables/Disables the process
    yaml_info (YAML: default [see above])
	- The structure of this variable can be found above with default values.

##License

Copyright 2015 Eric B

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
