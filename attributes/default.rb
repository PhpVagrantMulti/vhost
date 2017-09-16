##
# default.rb
# Default attributes
# Cookbook Name:: vhost
# Recipe:: default
# AUTHORS::   Seth Griffin <griffinseth@yahoo.com>
# Copyright:: Copyright 2015 Authors
# License::   GPLv3
#
# This file is part of PhpVagrantMulti.
# PhpVagrantMulti is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# PhpVagrantMulti is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with PhpVagrantMulti.  If not, see <http://www.gnu.org/licenses/>.
##

# Platform

# 0 = core
default["vhost"]["platform"]      = 0

# Your top level domain name
default["vhost"]["tld"]           = "com"

# The domain name of your website / product 
default["vhost"]["domain_name"]   = "example"

# Extension of your document root beyond /var/www/vhosts/local.domainname.com/
# Only needed if your doc root is something other than /var/www/vhosts/local.domainname.com/
# Examples:
#   - Symfony: /symfony-project-name/web
#   - Zend: /public

default["vhost"]["document_root"] = ""
