class Interaction {
	
	boot() { throw 'Not Implemented'; }
	error($err) { throw 'Not Implemented'; }
	login() { throw 'Not Implemented'; }
	register() { throw 'Not Implemented'; }
	
	/**
	 * Signal that a blocking operation is about to begin
	 * Calling this method results in the user being alerted that the app will become unresponsive
	 */
	startFgWork($time = 100) { throw 'Not Implemented'; }
	
	/**
	 * Signal that a blocking operation has ended
	 */
	stopFgWork($time = 200) { throw 'Not Implemented'; }
};


Interaction.prototype.startFgWork = function ($time = 100) {
		
	$('.js-working').fadeIn($time);
};

Interaction.prototype.stopFgWork = function ($time = 200) {
		
	$('.js-working').fadeOut($time);
};

Interaction.prototype.error = function ($err) {
	
	alert('Error: ' + $err.toString());
};

Interaction.prototype._handleFormDialog = function ($formCss, $submitCss, $requestName) {
	
	var res, rej;
	var d = new Promise(($res, $rej) => { res = $res; rej = $rej; });
	
	var dlgBox = $($formCss)[0];
	var dlgBtn = $($submitCss);
	var regHandler = $e => {
		
		dlgBtn.off('click', regHandler);
		dlgBox.close();
		
		var valArr = $($formCss).find('input').serializeArray();
		var vals = {};
		var i = 0;
		var l = valArr.length;
		while (i < l) {
			
			vals[valArr[i].name] = valArr[i].value;
			i++;
		}
		
		this.startFgWork();
		sgui.comm.request($requestName, vals).then(($res) => {
			
			this.stopFgWork();
			res($res);
		}, rej);
	};
	
	dlgBox.open();
	dlgBtn.on('click', regHandler);
	
	return d;
}

Interaction.prototype.register = function (/* maybe if options are set do not display a form or prefill it? */) {
	
	return this._handleFormDialog('.js-register__dialog', '.js-register .js-register__submit', 'register');
};

Interaction.prototype.login = function (/* maybe if options are set do not display a form or prefill it? */) {
	
	return new Promise(($res, $req) => {
		
		this._handleFormDialog('.js-login__dialog', '.js-login .js-login__submit', 'login').then($r => {
			
			var r = JSON.parse($r);
			if (r.status === 'ok') {
				
				$res(r.result);
			}
			else {
				
				$rej(r.message);
			}
		}, $rej);
	});
};

Interaction.prototype.boot = function () {
	
	this.startFgWork();
	
	var tasks = [];
	tasks.push(
		sgui.util.resolveProm(() => {
			
			return new Promise(($res, $rej) => {
				
				sgui.comm.request('getPart', { part: 'menu', }).then(
				
					sgui.comm.fire.bind(sgui.comm, 'menu', 'update'),
					$rej
				)
			});
		})
	);
	
	tasks.push(
		sgui.util.resolveProm(
			sgui.comm.request.bind(sgui.util, 'getData', { part: 'locales', })
		)
	);
	
	return new Promise(($res, $rej) => {
		
		Promise.all(tasks).then($r => {
			
			this.stopFgWork();
			$res($r);
		}, $err => {
			
			this.stopFgWork();
			$rej($err);
		});
	});
};
