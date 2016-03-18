'use strict';

class Util {
	
	resolveProm($fun) { throw 'Not Implemented'; }
};


Util.prototype.resolveProm = function ($fun) {
	
	return new Promise(($res, $rej) => {
		
		$fun().then($r => {
			
			$res({
				
				status: true,
				result: $r
			})
		}, $err => {
			
			$res({
				
				status: false,
				result: $err
			})
		});
	});
};
