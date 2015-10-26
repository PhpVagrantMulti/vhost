##
# default.rb
# Installs php vhost as configured into an independent vhost on the development vm
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

template "vhost.conf" do
    path "#{node["apache"]["dir"]}/sites-available/local.#{node["vhost"]["domain_name"]}.#{node["vhost"]["tld"]}.conf"
    source "vhost.conf.erb"
    owner  "www-data"
    group  "www-data"
    mode   "0644"
    variables ({
        :server_name     => "local.#{node["vhost"]["domain_name"]}.#{node["vhost"]["tld"]}",
        :document_root   => "local.#{node["vhost"]["domain_name"]}.#{node["vhost"]["tld"]}#{node["vhost"]["document_root"]}", 
        :error_log_name  => "local.#{node["vhost"]["domain_name"]}.#{node["vhost"]["tld"]}.error-log",
        :custom_log_name => "local.#{node["vhost"]["domain_name"]}.#{node["vhost"]["tld"]}.access-log" 
    })
end

execute "enable_vhost" do
    command "sudo a2ensite local.#{node["vhost"]["domain_name"]}.#{node["vhost"]["tld"]}"
    action :run
    notifies :restart, "service[apache2]", :immediately
end

