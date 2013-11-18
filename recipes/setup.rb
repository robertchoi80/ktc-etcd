#
# Recipe:: setup
#

if node["ha_disabled"]
  include_recipe "etcd::compile_time"
else
  include_recipe "etcd::cluster"
end
