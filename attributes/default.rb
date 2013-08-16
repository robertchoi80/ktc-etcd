include_attribute "etcd"

# can override in env
default[:etcd][:seed_node] = "etcd01"
default[:etcd][:search_cook] = "ktc-etcd"

# setup to source from github build
default[:etcd][:url]     = "https://dl.dropboxusercontent.com/u/848501/etcd-130813.tar.gz"
default[:etcd][:sha256]  = "7d7e6e71d27aad41345ba41a8b35dc57e01f70524a77cb7968b3c4fdc9f3ade3"
default[:etcd][:version] = "130813"

# retry for many times.. helps for fresh cluster building
default[:etcd][:args] = "-c #{fqdn}:4001 -s #{fqdn}:7001 -r 100"
