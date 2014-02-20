include_recipe 'ktc-etcd::setup'
include_recipe 'ktc-monitor::client'
include_recipe 'ktc-etcd::check_procs'
