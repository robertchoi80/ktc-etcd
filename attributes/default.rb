include_attribute "etcd"

# can override in env
default[:etcd][:seed_node] = "etcd01"
default[:etcd][:search_cook] = "ktc-etcd"

# retry for many times.. helps for fresh cluster building
default[:etcd][:args] = "-c #{ipaddress}:4001 -s #{ipaddress}:7001 -r 100"

# process monitoring
default[:etcd][:processes] = [
  { "name" =>  "etcd", "shortname" =>  "etcd" }
]
