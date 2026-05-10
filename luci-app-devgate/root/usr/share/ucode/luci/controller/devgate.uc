'use strict';

function remote_addr() {
	let addr = getenv('REMOTE_ADDR') || getenv('HTTP_X_REAL_IP') || '';

	return addr + '\n';
}

return {
	remote_addr
};
