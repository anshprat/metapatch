#!/bin/sh
echo "This file is only for testing patching"
installed_version=`rpm -qa --info  metapatch|grep Version|awk '{print $3}'` &>/dev/null
yum clean all &>/dev/null && yum check-update metapatch &>/dev/null
is_update_available=$?
if [ ${is_update_available} -eq 100 ]
then
  available_version=`yum check-update metapatch |grep metapatch|awk '{print $2}'` &>/dev/null
  echo "Installed version ${installed_version}"
  echo "Newer version ${available_version} available"
else
  echo "Installed version ${installed_version} seems to be latest version atm"
fi
