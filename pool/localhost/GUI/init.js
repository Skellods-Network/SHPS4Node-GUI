function init() {
	
	if (window.sgui) {
		
		alert('Something went wrong :/');
		return;
	}
	
	window.sgui = {
		
		comm: new Communication(),
		interact: new Interaction(),
		util: new Util(),
	};
	
	sgui.interact.startFgWork();
	
	// First of all, let's check if even a single user has been registered and is inside the admin group
	// If not, a registration dialog should be displayed. Else a login prompt should be shown.
	// We will use ws for everything!
	// Comment: Maybe later. Let's keep it easy for now and just use AJAJ
	sgui.comm.request('getUserStatus').then($res => {
		
		sgui.interact.stopFgWork();
		if ($res === 0) {// User is logged in, boot up app
			
			sgui.interact.boot();
		}
		else if ($res === 1) {// Users available, start login process
			
			sgui.interact.login().then(($r) => {
				
				if ($r != false) {
					
					sgui.interact.boot();
				}
				else {
					
					// Go into login loop
				}
			}, () => {});
		}
		else {// No users available, start first registration
			
			sgui.interact.register().then(() => {
				
				sgui.interact.boot();
			}, () => {});
		}
	}, sgui.interact.error);
};
