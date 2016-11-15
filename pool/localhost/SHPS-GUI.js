'use strict';

const SHPSGUI = {};

SHPSGUI._hasClass = function hasClass(el, className) {
    
    if (el.classList) {
  
        return el.classList.contains(className);
    }
    else {
        
        return !!el.className.match(new RegExp('(\\s|^)' + className + '(\\s|$)'));
    }
};

SHPSGUI._addClass = function addClass(el, className) {
    
    if (el.classList) {
      
        el.classList.add(className);
    }
    else if (!_hasClass(el, className)) {
    
        el.className += ' ' + className;
    }
};

SHPSGUI._removeClass = function removeClass(el, className) {
    
    if (el.classList) {
        
        el.classList.remove(className);
    }
    else if (_hasClass(el, className)) {
        
        var reg = new RegExp('(\\s|^)' + className + '(\\s|$)');
        el.className = el.className.replace(reg, ' ');
    }
};


SHPSGUI.Main = new function () {

    document.querySelector('.js-submit').addEventListener('click', function($ev) {
        
        $ev.preventDefault();
        
        //TODO get state
        switch (this.getAttribute('action')) {
            
            case 'register': {
                
                SHPSGUI.Communication.send('register', {
            
                    user: document.querySelector('.js-user').value,
                    mail: document.querySelector('.js-mail').value,
                    password: document.querySelector('.js-password').value,
                });
                
                break;
            }
            case 'login': {
                
                SHPSGUI.Communication.send('login', {
            
                    user: document.querySelector('.js-user').value,
                    password: document.querySelector('.js-password').value,
                });
                
                break;
            }
        }
        
    }, false);
    
};

SHPSGUI.Interaction = new function () {
    
    const actions = {};
    
    /* change desktop */
    actions.cd = $ev => {
        
        const target = $ev.target.getAttribute('action-target');
        SHPSGUI.Communication.send('getDesktop', target);
    };
    
    
    this.initMenus = () => {
        
        const menus = Array.from(document.getElementsByClassName('js-menu'));
        for (let menu of menus) {
            
            menu.addEventListener('click', this.menuAction);
        }
    };
    
    this.menuAction = $ev => {
        
        if (SHPSGUI._hasClass($ev.target, 'js-menu__item')) {
            
            $ev.stopPropagation();
            const action = $ev.target.getAttribute('click-action');
            if (typeof actions[action] !== 'undefined') {
                
                actions[action]($ev);
            }
        }
    };
};

SHPSGUI.Communication = new function () {
    
    const funs = {};
    const sendBuffer = [];
    var SHPSSID = '';
    
    funs.test = $data => {
        
        alert('test: ' + JSON.stringify($data));
    };
    
    funs.error = $data => {
        
        alert('A server error occurred: ' + $data);
    };
    
    funs.login = $data => {
        
        if ($data.r) {
            
            SHPSSID = $data.id;
            this.send('getApp');
        }
        else {
            
            //TODO: improve
            alert('Login not successful!');
        }
    };
    
    funs.getApp = $data => {
        
        document.getElementById('content').innerHTML = $data;
        SHPSGUI.Interaction.initMenus();
    };
    
    funs.getDesktop = $data => {
        
        document.getElementById('desktop').innerHTML = $data;
    };
    
    
    //TODO: remove static path
    const ws = new ReconnectingWebSocket('ws://localhost:1280', 'shps-chan', {
        
        reconnectDecay: 1.0,
    });
    
    this.send = ($command, $data) => {
        
        if (ws.readyState !== WebSocket.OPEN) {
            
            sendBuffer.push([$command, $data]); // [...arguments] is buggy in Chrome
            
            return;
        }
        
        ws.send(JSON.stringify({
            c: $command,
            d: $data,
        }));
    };
    
    ws.onopen = $ev => {
        
        while (sendBuffer.length) {
            
            this.send.apply(this, sendBuffer.pop());
        }
    };
    
    ws.onmessage = $ev => {
        
        const payload = JSON.parse($ev.data);
        this.handleCommand(payload.c, payload.d);
    };
    
    this.handleCommand = ($command, $data) => {
        
        if (typeof funs[$command] !== 'undefined') {
            
            funs[$command]($data);
        }
    };
};
