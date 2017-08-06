#!/bin/bash
###############################################################################
# Name        : www_perm.sh                                                   #
# Description : sets permissions on /var/www correctly                        #
#                                                                             #
#                                                                             #
# Author      : Scott Walkinshaw                                              #
# Date        : 25th March 2017                                               #
#                                                                             #
###############################################################################
###############################################################################
# File Modification History                                                   #
###############################################################################
# Inits | Date      | Vers | Description                                      #
# SW    | 25 Mar 17 | 1.00 | Initial Issue                                    #
###############################################################################
sudo chown -RL scott:www-data /var/www

if [[ "$1" == "-s" ]]; then

  echo "$(basename $0): [setting secure permissions]"

  ####
  #  Very secure:
  #  webserver wont be able to write any files
  #  if it has to then they need to be manually set to 0660
  ####
  sudo find -L /var/www -type f -exec chmod 0640 {} \;
  sudo find -L /var/www -type d -exec chmod 2750 {} \;

else

  echo "$(basename $0): [setting slightly inseure permissions]"

  #####
  #  Slightly less secure:
  #  webservice can't write to any files
  ####
  sudo find -L /var/www -type f -exec chmod 0660 {} \;
  sudo find -L /var/www -type d -exec chmod 2770 {} \;

fi
exit

####
#  MediaWiki specific permissions
####
if [[ "$(uname -n)" == "chicago" ]]; then
  echo "$(basename $0): [setting MediaWiki permissions]"
  chmod -R 2770 /var/www/public_html/wiki_test/cache
  chmod -R 2770 /var/www/public_html/wiki_test/images
  chmod -R 2770 /var/www/public_html/wiki_test/extensions/BlueSpiceFoundation/data
  chmod -R 2770 /var/www/public_html/wiki_test/extensions/BlueSpiceFoundation/config

  find /var/www/public_html/wiki_test/cache  -type f -exec chmod 0660 {} \;
  find /var/www/public_html/wiki_test/images -type f -exec chmod 0660 {} \;
  find /var/www/public_html/wiki_test/extensions/BlueSpiceFoundation/data -type f -exec chmod 0660 {} \;
  find /var/www/public_html/wiki_test/extensions/BlueSpiceFoundation/config -type f -exec chmod 0660 {} \;
fi

####
#  Bugzilla specific permissions
####
if [[ "$(uname -n)" == "chicago" ]]; then
  echo "$(basename $0): [setting Bugzilla permissions]"
  chmod 2770 /var/www/public_html/bugzilla/data
  find -L /var/www/public_html/bugzilla -name "*cgi" -exec chmod 0750 {} \;
  find -L /var/www/public_html/bugzilla -name "*pl"  -exec chmod 0750 {} \;
fi
