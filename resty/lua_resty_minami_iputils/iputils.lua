local _M = {}


local iputils = require "resty.lua_resty_iputils.iputils"

function _M.table(filedir)
	--initialize table
	local ips_table = {}

	--read contents lines by lines
	local filename = io.lines(filedir)
	for ip in filename do
		table.insert(ips_table, ip)
	end

	--return value
	return ips_table
end

function _M.iputils_lrucache(zone)
	--create a global lrucache object
	local  lrucache_enable = iputils.lrucache_enable(zone)
	return lrucache_enable
end

function _M.iputils_parsecidrs(table)
	--takes a table of CIDR format IPV4 networks and returns a table containing the lower and upper addresses
	--if an invalid network is in the table, an error will be logged and the other networks will be returned
	local  parse_cidrs = iputils.parse_cidrs(table)
	return parse_cidrs
end

function _M.iputils_binipincidrs(ip, table)
	--returns a true or false if the IP exists within any of the specified networks
	--returns nil and an error message with an invalid IP
	local  binip_in_cidrs = iputils.binip_in_cidrs(ip, table)
	return binip_in_cidrs
end


return _M
