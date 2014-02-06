include_attribute 'etcd'

# can override in env
default[:etcd][:seed_node] = 'etcd01'
default[:etcd][:search_cook] = 'ktc-etcd'

# process monitoring
default[:etcd][:processes] = [
  { 'name' =>  'etcd', 'shortname' =>  'etcd' }
]
