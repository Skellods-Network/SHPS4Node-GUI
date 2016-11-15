'use strict';

const libs = require('node-mod-load').libs;
const defer = require('promise-defer');
const ws = require('websocket');
const async = require('vasync');
const q = require('q');

const me = module.exports;
const funs = {};

var wsServer;


const send = ($requestState, $command, $data) => {
    
    $requestState.connection.send(JSON.stringify({
        c: $command,
        d: $data,
    }));
};

const getPartial = ($requestState, $name) => {
    
    const d = defer();
    
    // Shamelessly copied from the SHPS4Node-make module.
    // Workflows and Pipelines will make this part more generic,
    // Which means that a very simple call into SHPS might be enough.
    // For now, this is what is possible.
    async.waterfall([
    
        function ($cb) {

            libs.make.getPartial($requestState, $name, undefined).done($cb.bind(undefined, null), $cb);
        },
        function ($res, $cb) {
            
            if ($res.body.body) {
                
                $res = $res.body;
            }
            
            libs.make.executeBody($requestState, $res).done($cb.bind(undefined, null), $cb);
        },
        function ($res, $cb) {
            
            libs.make.parseTemplate($requestState, $res.result).done($cb.bind(undefined, null), $cb);
        },
        function ($res, $cb) {

            if (q.isPromise($res.body)) {
                
                $res.body.done($cb.bind(undefined, null), $cb);
            }
            else {
                
                $cb(null, $res);
            }
        },
    ], function ($err, $res) {
        
        if ($err) {
            
            d.reject($err);
        }
        else {
            
            d.resolve($res.body);
        }
    });
    
    return d.promise;
};

funs.test = ($requestState, $data) => {
    
    libs.coml.write('test: ' + JSON.stringify($data));
    send($requestState, 'test', $data);
};

funs.register = ($requestState, $data) => {
    
    //TODO: first check if no user has been registered, yet!

    const auth = libs.auth.newAuth($requestState);
    auth.register($data.user, $data.password, $data.mail, false).done(() => {
        
        auth.login($data.user, $data.password).done($r => {
            
            if ($r) {
                
                send($requestState, 'login', {
                    
                    r: true,
                    id: $requestState.COOKIE.getCookie('SHPSSID'),
                });
            }
            else {
                
                send($requestState, 'error', 'Internal SHPS error, please open an issue on GitHub!');
            }
        }, $err => {
            
            send($requestState, 'error', $err.toString());
        });
    }, $err => {
        
        send($requestState, 'error', $err.toString());
    });
};

funs.login = ($requestState, $data) => {
    
    const auth = libs.auth.newAuth($requestState);
    auth.login($data.user, $data.password).done($r => {
            
        send($requestState, 'login', {
            
            r: $r,
            id: $requestState.COOKIE.getCookie('SHPSSID'),
        });
    }, $err => {
            
        send($requestState, 'error', $err.toString());
    });
};

funs.getApp = ($requestState, $data) => {
    
    getPartial($requestState, 'app').then($html => {
        
        send($requestState, 'getApp', $html);
    }, $err => {
        
        send($requestState, 'error', $err.body);
    });
};

funs.getDesktop = ($requestState, $data) => {
    
    getPartial($requestState, $data.toString()).then($html => {
        
        send($requestState, 'getDesktop', $html);
    }, $err => {
        
        send($requestState, 'error', $err.body);
    });
};

me.onLoad = function () {

    libs.schedule.addSlot('onListenStart', ($protocol, $port, $httpServer) => {
        
        wsServer = new ws.server({
            
            httpServer: $httpServer,
            autoAcceptConnections: false,
        });
        
        wsServer.on('request', $request => {

            var con = $request.accept('shps-chan', $request.origin);
            var rs = libs.helper.newRequestState($request, null);
            rs.connection = con;
            rs.request.headers = [];

            con.on('message', function ($msg) {

                if ($msg.type === 'utf8') {

                    var payload = JSON.parse($msg.utf8Data);
                    if (typeof funs[payload.c] !== 'undefined') {
                        
                        funs[payload.c](rs, payload.d);
                    }
                }
            });
        });
    });
};
