--variable 'list' is defined at 'init' phrase
local ok, err = iputils.iputils_binipincidrs(ngx.var.binary_remote_addr, list)

if not ok then
	-- code body
end
