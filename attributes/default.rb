include_attribute "etcd"

# can override in env
default[:etcd][:seed_node] = "etcd01"
default[:etcd][:search_cook] = "ktc-etcd"

# setup to source from github build
default[:etcd][:url]     = "https://dl.dropboxusercontent.com/u/848501/etcd-130907.tar.gz"
default[:etcd][:sha256]  = "6867fc7b6a53d60d93f2c53c3a06d4f5d8143ad06ca26a76b8d5b4d830248c2d"
default[:etcd][:version] = "130907"

# retry for many times.. helps for fresh cluster building
default[:etcd][:args] = "-c #{ipaddress}:4001 -s #{ipaddress}:7001 -r 100"

# process monitoring
default[:etcd][:processes] = [
  { "name" =>  "etcd", "shortname" =>  "etcd" }
]
