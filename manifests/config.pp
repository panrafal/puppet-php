# == Class: php::config
#
# Configure php.ini settings for a PHP SAPI
#
# === Parameters
#
# [*inifile*]
#   The path to ini file
#
# [*settings*]
#   The hash having key => values pairs to change
#
# === Variables
#
# No variables
#
# === Examples
#
#  php::config { '$unique-name':
#    inifile  => '$full_path_to_ini_file'
#    settings => {
#      set => {
#        '.anon/apc.enabled' => 1
#      }
#    }
#  }
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
#
# === Copyright
#
# Copyright 2012-2013 Christian "Jippi" Winther, unless otherwise noted.
#
define php::config(
  $file,
  $config
) {

  include php::augeas

  augeas { "php-${name}-config":
    incl      => $file,
    changes   => $config,
    load_path => $php::params::augeas_contrib_dir,
    lens      => 'PHP.lns',
    require   => Class['php::augeas']
  }

}
