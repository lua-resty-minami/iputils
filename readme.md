Name
====
lua-resty-minami/iputils : Openresty library to build conf based on $remote_addr

thanks and based: https://github.com/hamishforbes/lua-resty-iputils


Table of Contents
=================
* [Name](#name)
* [Status](#status)
* [Description](#description)
* [Synopsis](#synopsis)
* [Author](#author)
* [Copyright and License](#copyright-and-license)
* [See Also](#see-also)


Status
======
This library is considered passed testing and may change without notice.

[Back to TOC](#table-of-contents)


Description
===========
This library requires a Openresty build, please take [here](https://sometimesnaive.org/article/71) as reference.

[Back to TOC](#table-of-contents)


Synopsis
========
```nginx
# nginx.conf

# library folder 'resty' dir
lua_package_path "/path/to/conf/?.lua;;";

# init phrase
init_by_lua_file  /path/to/conf/init.lua;


# website.conf
location / {
    ...
    
    access_by_lua_file  /path/to/conf/access.lua;
}
```

```lua
-- thanks and based: https://github.com/hamishforbes/lua-resty-iputils



-- init.lua

local iputils = require "resty.lua_resty_minami_iputils.iputils"

-- enable lrucache
-- value '4000' is optional and defaults to 4000 entries (~1MB per worker)
iputils.iputils_lrucache(4000)

-- generate variable 'ips_table'
-- value '".../ip.list"' defines the absolute directory of the iplist file
local ips_table = iputils.table(".../ip.list")

-- then generate parsed table
-- warning: this variable should keep globalized
list = iputils.iputils_parsecidrs(ips_table)



-- access.lua

-- variable 'list' is defined at 'init' phrase
-- this directive is to check the $binary_remote_addr is in iplist or not
local ok, err = iputils.iputils_binipincidrs(ngx.var.binary_remote_addr, list)

-- then run codes
if not ok then
    -- code body
end
```

[Back to TOC](#table-of-contents)


Author
======
Minami (Nanqinlang) (南琴浪) <https://sometimesnaive.org/>

[Back to TOC](#table-of-contents)


Copyright and License
=====================
personal work, for non-profit, Copyright (C) 2018 All rights reserved.

This library's License: GPL v3.

[Back to TOC](#table-of-contents)


See Also
========
* the ngx_lua module: http://wiki.nginx.org/HttpLuaModule

[Back to TOC](#table-of-contents)
