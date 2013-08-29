#
# Recipe:: defualt
#


include_recipe "partial_search"

def run_it_now(action, search)
  r =  run_context.resource_collection.find( search)
  r.run_action action.to_sym
end

if node["ha_disabled"]
  include_recipe "etcd"
else
  include_recipe "etcd::cluster"

  # find the file for building the etcd_members that etcd::cluster should
  # define, and make sure that it creates itself in chef compile time
  run_it_now :create, file: "/etc/etcd_members"
end

# do the same compile time hackery for the rest of the resources
#

log "doing things"
run_it_now :install, ark: "etcd"
run_it_now :create, template: "/etc/init/etcd.conf"
