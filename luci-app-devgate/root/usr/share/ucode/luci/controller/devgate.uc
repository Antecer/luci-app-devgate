'use strict';

function append_addr(list, http, name) {
	let value = '';

	if (http)
		value = http.getenv(name) || '';

	if (!value)
		value = getenv(name) || '';

	if (value)
		push(list, value);
}

function remote_addr(env) {
	let http = env && env.http;
	let addr = '';
	let values = [];

	append_addr(values, http, 'HTTP_X_FORWARDED_FOR');
	append_addr(values, http, 'HTTP_X_REAL_IP');
	append_addr(values, http, 'HTTP_CF_CONNECTING_IP');
	append_addr(values, http, 'HTTP_TRUE_CLIENT_IP');
	append_addr(values, http, 'HTTP_FORWARDED');
	append_addr(values, http, 'REMOTE_ADDR');

	for (let value in values)
		addr += value + '\n';

	print(addr);
}

return {
	remote_addr
};
