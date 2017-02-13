local winfle = ngx.shared.winfle

-- winfle:flush_all()
ngx.header['Content-type'] = 'text/html'

local cache_hit = winfle:get(ngx.var.uri)

if cache_hit == nil then
	local res = ngx.location.capture (
		"/backend" .. ngx.var.uri, 
	);

	if res.status == ngx.HTTP_OK then
    	winfle:set(ngx.var.uri, res.body)
	else
    	ngx.exit(404);
	end
end

ngx.say('CACHE HIT');
ngx.say(winfle:get(ngx.var.uri))
