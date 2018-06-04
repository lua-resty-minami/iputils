-- thanks and based: https://github.com/hamishforbes/lua-resty-iputils

--import
local iputils = require "resty.lua_resty_minami_iputils.iputils"

--enable lrucache
iputils.iputils_lrucache(4000)

--generate variable 'ips_table'
local ips_table = iputils.table(".../ip.list")
--then generate parsed table
list = iputils.iputils_parsecidrs(ips_table)
