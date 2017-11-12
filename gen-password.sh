#!/bin/bash

newpassword=$(/Users/Git/_data-tools-analytics.bk.0/environmentsetup/common/password-gen.ksh 10)
Text_to_encrypt=$newpassword
echo "INFO:  new password: $newpassword"
