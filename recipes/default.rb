#
# Recipe:: defualt
#

if node["ha_disabled"]
  include_recipe "etcd::compile_time"
else
  include_recipe "etcd::cluster"
end

# process monitoring and sensu-check config
processes = node["etcd"]["processes"]

processes.each do |process|
  sensu_check "check_process_#{process['name']}" do
    command "check-procs.rb -c 10 -w 10 -C 1 -W 1 -p #{process['name']}"
    handlers ["default"]
    standalone true
    interval 20
  end
end

collectd_processes "etcd-processes" do
  input processes
  key "shortname"
end
