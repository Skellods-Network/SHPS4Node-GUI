$(document).ready(function () {
	
	var startFgWork = function () {
		
		$('.c-working').fadeIn(100);
	};
	
	// First of all, let's check if even a single user has been registered and is inside the admin group
	// If not, a registration dialog should be displayed. Else a login prompt should be shown.
	// We will use ws for everything!
	startFgWork();
	
});