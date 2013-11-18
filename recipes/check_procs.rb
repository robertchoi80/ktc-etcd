#
# Recipe:: check_procs
#
include_recipe "ktc-monitor::client"

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
