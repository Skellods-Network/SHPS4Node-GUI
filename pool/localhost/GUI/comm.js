class Communication {
	
	/**
	 * Executes a SHPS Request Script and returns the result or rejects with an Error
	 */
	request($name, $params = {}) { throw 'Not Implemented'; }
};


Communication.prototype.request = function ($name, $params = {}) {
	
	return new Promise(($res, $rej) => {
		
		$.ajax({
			
			type: 'POST',
			url: '/?request=' + $name,
			data: $params,
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		})
		.done($data => {
			
			var data = JSON.parse($data);
			if (data.status === 'ok') {
				
				$res(data.result);
			}
			else {
				
				$rej(new Error(data.message));
			}
		})
		.fail(($xhr, $text, $err) => {
			
			$rej($err);
		});
	});
};
