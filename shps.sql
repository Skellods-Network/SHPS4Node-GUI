SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


TRUNCATE TABLE `accesskey`;
INSERT INTO `accesskey` (`ID`, `name`, `description`) VALUES
(0, 'SYS_NULL', 'Every user/guest has this access key. Always.');

TRUNCATE TABLE `content`;
INSERT INTO `content` (`ID`, `name`, `content`, `namespace`, `language`, `accessKey`, `tls`, `extSB`) VALUES
(1, 'index', 'OK', 0, 0, 0, 0, 0);

TRUNCATE TABLE `css`;
INSERT INTO `css` (`ID`, `name`, `content`, `comment`, `namespace`, `language`, `mediaQuery`) VALUES
(1, '._fonthack', '-webkit-font-smoothing:antialiased !important;\ntext-shadow:1px 1px 1px rgba(0,0,0,0.004);\n-webkit-text-stroke:1px transparent;', '', 0, 0, 0),
(2, '@font-face', 'font-family: ''FontAwesome'';\n\nsrc: url(''/?font_fa_eot&v=4.4.0'');\nsrc:\n  url(''/?file=font_fa_eot&#iefix&v=4.4.0'') format(''embedded-opentype''),\n  url(''/?file=font_fa_woff2&v=4.4.0'') format(''woff2''),\n  url(''/?file=font_fa_woff&v=4.4.0'') format(''woff''),\n  url(''/?file=font_fa_ttf&v=4.4.0'') format(''truetype''),\n  url(''/?file=font_fa_svg&v=4.4.0#fontawesomeregular'') format(''svg'');\n\nfont-weight: normal;\nfont-style: normal;', '', 0, 0, 0),
(3, '.c-menubar', 'height: 30px;\npadding: 5px 10px 5px 10px;', '', 0, 0, 0),
(4, '.t-default__menubar', 'background-color: hsl(0,0%,95%);\r\ncolor: hsl(0,0%,5%);', '', 0, 0, 0),
(5, '.u-clickable', 'cursor: pointer;\r\n', '', 0, 0, 0),
(6, '.u-clickable:hover', 'color: hsl(4, 100%, 50%);\r\nbox-shadow: 0px 0px 10px 0px hsla(4, 100%, 50%, 0.75);', '', 0, 0, 0),
(7, '.u-clickable--no-shadow:hover', 'box-shadow: none !important;', '', 0, 0, 0),
(8, '.t-default__body', 'background-color: hsl(0,0%,15%);', '', 0, 0, 0),
(9, 'html, body', 'color: hsl(0,0%,95%);\r\n\r\nwidth: 100%;\r\nheight: 100%;', '', 0, 0, 0),
(10, '.c-working', 'display: none;', 'Working Indicator', 0, 0, 0),
(11, '.u-center__outer-div', 'position: relative;\nwidth: 1px;\nheight: 50%;\noverflow: visible;\nmargin: auto;', '', 0, 0, 0),
(12, '.u-center__inner-div', 'vertical-align: bottom;\r\nposition: absolute;\r\nbottom: 0;', '', 0, 0, 0),
(13, '.u-center__element', 'margin-bottom: -50%;\r\nmargin-left: -50%;', '', 0, 0, 0),
(14, '.o-overlay__background', 'position: fixed;\nwidth: 100%;\nheight: 100%;\nbackground: black;\nbackground-color: hsla(0, 0%, 0%, 0.6);\nz-index: 99999;\ntop: 0px;\nleft: 0px;', '', 0, 0, 0),
(15, '.o-dialog', 'overflow-y: scroll;', '', 0, 0, 0);

TRUNCATE TABLE `filetype`;
INSERT INTO `filetype` (`ID`, `name`, `mimeType`) VALUES
(1, 'css', 1),
(2, 'js', 2);

TRUNCATE TABLE `group`;
INSERT INTO `group` (`ID`, `name`) VALUES
(1, 'SHPSGUI_ADMIN');

TRUNCATE TABLE `groupsecurity`;
TRUNCATE TABLE `groupuser`;
INSERT INTO `groupuser` (`uid`, `gid`, `from`, `to`) VALUES
(13, 1, 0, 4294967295);

TRUNCATE TABLE `include`;
INSERT INTO `include` (`file`, `fileType`, `namespace`) VALUES
(1, 1, 0),
(2, 1, 0),
(4, 2, 0),
(10, 1, 0),
(13, 2, 0),
(14, 2, 0),
(15, 1, 0),
(21, 2, 0),
(17, 2, 0),
(22, 2, 0),
(23, 2, 0),
(24, 2, 0),
(25, 2, 0);

TRUNCATE TABLE `language`;
INSERT INTO `language` (`ID`, `name`) VALUES
(0, 'en');

TRUNCATE TABLE `log`;
TRUNCATE TABLE `loginquery`;
INSERT INTO `loginquery` (`uid`, `time`) VALUES
(13, 1458228394);

TRUNCATE TABLE `loglevel`;
TRUNCATE TABLE `mediaquery`;
TRUNCATE TABLE `mimetype`;
INSERT INTO `mimetype` (`ID`, `name`) VALUES
(1, 'text/css'),
(2, 'application/javascript'),
(3, 'application/vnd.ms-fontobject'),
(4, 'application/font-woff2'),
(5, 'application/font-woff'),
(6, 'application/font-sfnt'),
(7, 'image/svg+xml');

TRUNCATE TABLE `namespace`;
INSERT INTO `namespace` (`ID`, `name`) VALUES
(0, 'default'),
(1, 'element');

TRUNCATE TABLE `oldpassword`;
TRUNCATE TABLE `partial`;
INSERT INTO `partial` (`ID`, `name`, `language`, `content`, `namespace`, `accessKey`, `extSB`) VALUES
(1, 'site', 0, '<!DOCTYPE HTML>\r\n\r\n<title>SHPS GUI</title>\r\n<style type="text/css">\r\n* {\r\n  margin: 0;\r\n  padding: 0;\r\n  border: 0;\r\n  position: relative;\r\n  z-index: 0;\r\n}\r\n</style>\r\n\r\n{$css}\r\n{$elements}\r\n\r\n<body class="t-default__body">\r\n\r\n{$menubar}\r\n{$sidemenu}\r\n{$helpers}\r\n\r\n{$register}\r\n\r\n{$body}\r\n\r\n{$js}', 0, 0, 0),
(2, 'test', 0, 'TEST ELEMENT', 1, 0, 0),
(3, 'menubar', 0, '<paper-toolbar>\r\n  <paper-icon-button icon="menu"></paper-icon-button>\r\n  <div class="title">SHPS GUI</div>\r\n</paper-toolbar>', 0, 0, 0),
(4, 'sidemenu', 0, '<div class="c-sidemenu">\r\n\r\n</div>', 0, 0, 0),
(8, 'login', 0, '<paper-dialog modal class="js-login__dialog">\r\n\r\n  <h2>###login-header###</h2>\r\n  ###login-description###\r\n\r\n  <form class="js-login / c-login">\r\n    <paper-input label="###login-user###" class="js-login__user" name="user"></paper-input>\r\n    <paper-input label="###login-password###" type="password" class="js-login__password" name="password"></paper-input>\r\n\r\n    <div class="buttons">\r\n      <paper-button class="js-login__submit">###login-submit###</paper-button>\r\n    </div>\r\n  </form>\r\n\r\n</paper-dialog>', 0, 0, 0),
(6, 'elements', 0, '<link rel="import" href="/iron-input/iron-input.html">\r\n<link rel="import" href="/iron-icon/iron-icon.html">\r\n<link rel="import" href="/iron-icons/iron-icons.html">\r\n\r\n<link rel="import" href="/paper-toolbar/paper-toolbar.html">\r\n<link rel="import" href="/paper-icon-button/paper-icon-button.html">\r\n<link rel="import" href="/paper-dialog/paper-dialog.html">\r\n<link rel="import" href="/paper-dialog-behavior/paper-dialog-behavior.html">\r\n<link rel="import" href="/paper-input/paper-input.html">\r\n<!-- <link rel="import" href="/paper-input-container/paper-input-container.html"> -->\r\n<link rel="import" href="/paper-button/paper-button.html">\r\n\r\n<link rel="stylesheet" href="/paper-styles/color.html">', 0, 0, 0),
(9, 'helpers', 0, '{$login}\n{$workingIndicator}', 0, 0, 0),
(10, 'workingIndicator', 0, '<div class="o-overlay__background / c-working / js-working">\r\n  <div class="u-center__outer-div">\r\n    <div class="u-center__inner-div">\r\n      <span class="fa fa-cog fa-spin fa-5x / u-center__element"></span>\r\n    </div>\r\n  </div>\r\n</div>', 0, 0, 0),
(11, 'register', 0, '<paper-dialog modal class="js-register__dialog / c-register / o-dialog">\r\n\r\n  <h2>###register-header###</h2>\r\n  ###register-description###\r\n\r\n  <form class="js-register / c-register">\r\n    <paper-input label="###register-user###" class="js-register__user" name="user"></paper-input>\r\n    <paper-input label="###register-password###" type="password" class="js-register__password" name="password"></paper-input>\r\n    <paper-input label="###register-mail###" type="mail" class="js-register__mail" name="mail"></paper-input>\r\n\r\n    <div class="buttons">\r\n      <paper-button class="js-register__submit">###register-submit###</paper-button>\r\n    </div>\r\n  </form>\r\n\r\n</paper-dialog>', 0, 0, 0);

TRUNCATE TABLE `passquery`;
INSERT INTO `passquery` (`pass`, `time`) VALUES
('test', 1458228394);

TRUNCATE TABLE `plugin`;
INSERT INTO `plugin` (`GUID`, `name`, `namespace`, `status`, `accessKey`, `order`) VALUES
('334b0f33-8a07-11e5-8000-801934e9dffd', 'SHPS4Node-GUI', 0, 3, 0, 0);

TRUNCATE TABLE `request`;
INSERT INTO `request` (`name`, `script`, `language`, `accessKey`, `namespace`, `tls`, `extSB`) VALUES
('getElement', '// Let''s make a Promise to conveniently return a result and script status to SHPS\r\nnew Promise(($res, $rej) => {\r\n\r\n  if (!GET.element) {\r\n  \r\n    $rej(''No element specified!'');\r\n  }\r\n  else {\r\n  \r\n    // Let''s retrive a free SQL connection to the `default` alias from the connection pool\r\n    sql.newSQL().then($sql => {\r\n  \r\n      var tblNS = $sql.openTable(''namespace'');\r\n      var tblPart = $sql.openTable(''partial'');\r\n  \r\n      // And then specify what we want to get, how the tables are connected and which selection criteria we want to use\r\n      // For security purposes, this request script should only be able to return actual elements, so we put all elements into one namespace and only allow partials from that one namespace\r\n      $sql.query()\r\n        .get([tblPart.col(''content'')])\r\n        .fulfilling()\r\n        .eq(tblNS.col(''ID''), tblPart.col(''namespace''))\r\n        .eq(tblNS.col(''name''), ''element'')\r\n        .eq(tblPart.col(''name''), GET.element)\r\n        .execute()\r\n        .then($rows => {\r\n  \r\n          if ($rows.length <= 0) {\r\n  \r\n            $rej(''No element `'' + GET.element + ''` found!'');\r\n          }\r\n          else {\r\n  \r\n            $res($rows[0].content);\r\n          }\r\n        });\r\n    });\r\n  }\r\n});', 1, 0, 0, 0, 0),
('getUserStatus', '/**\r\n * Send back status of current user\r\n *\r\n * 0: User is logged in - app can proceed to request classified content\r\n * 1: User is not logged in, but logging in is possible\r\n * 2: There are no users available - app should start first registration\r\n */\r\n\r\nvar d = require(''q'').defer();\r\n\r\nif (auth.isLoggedIn()) {\r\n\r\n  d.resolve(0);\r\n}\r\nelse {\r\n\r\n  auth.getIDFromGroup(''SHPSGUI_ADMIN'').done($id => {\r\n\r\n    sql.newSQL(''usermanagement'').done($sql => {\r\n\r\n      var tblGu = $sql.openTable(''groupuser'');\r\n      $sql.query()\r\n        .get(tblGu.col(''uid''))\r\n        .fulfilling()\r\n        .eq(tblGu.col(''gid''), $id)\r\n        .execute()\r\n        .done($rows => {\r\n\r\n          $sql.free();\r\n          d.resolve($rows.length > 0 ? 1 : 2);\r\n        }, $err => {\r\n\r\n          $sql.free();\r\n          d.reject($err);\r\n        });\r\n    }, d.reject);\r\n  }, d.reject);\r\n}\r\n\r\nd.promise;', 1, 0, 0, 0, 1),
('register', 'var d = require(''q'').defer();\r\nvar async = require(''vasync'');\r\n\r\n//TODO: check if admin already exists\r\n\r\n\r\nvar userID = 0;\r\nvar groupID = 0;\r\n\r\n//console.log ((finaleFun instanceOf Function).toString());\r\n\r\nasync.waterfall([\r\n\r\n  $cb => {\r\n\r\n    auth.register(POST.user, POST.password, POST.mail, false).done($res => { $cb(null, $res); }, ($err) => {\r\n\r\n      console.log(''ERROR: '' + JSON.stringify($err));\r\n      $cb($err);\r\n    });\r\n  },\r\n  ($res, $cb) => {\r\n\r\n    // Only add to group if no admin is available! Else quit here\r\n\r\n    auth.getIDFromUser(POST.user).done($cb.bind(null, null), $cb);\r\n  },\r\n  ($res, $cb) => {\r\n\r\n    userID = $res;\r\n    auth.getIDFromGroup(''SHPSGUI_ADMIN'').done($cb.bind(null, null), $cb);\r\n  },\r\n  ($res, $cb) => {\r\n\r\n    groupID = $res;\r\n    sql.newSQL(''usermanagement'').done($sql => {\r\n\r\n      $sql.openTable(''groupuser'').insert({\r\n\r\n        uid: userID,\r\n        gid: groupID,\r\n      }).done($res => {\r\n\r\n        $sql.free();\r\n        $cb(null, $res);\r\n      }, $err => {\r\n\r\n        $sql.free();\r\n        $cb($err);\r\n      })\r\n    }, $cb);\r\n  },\r\n  ($res, $cb) => {\r\n\r\n    auth.login(POST.user, POST.password).done($cb.bind(null, null), $cb);\r\n  },\r\n], ($err, $res) => {\r\n\r\n  if ($err) {\r\n\r\n    d.reject($err);\r\n  }\r\n  else {\r\n\r\n    d.resolve();\r\n  }\r\n});\r\n\r\nd.promise;', 1, 0, 0, 0, 1),
('login', 'auth.login(POST.user, POST.password);', 1, 0, 0, 0, 0);

TRUNCATE TABLE `scriptlanguage`;
INSERT INTO `scriptlanguage` (`ID`, `name`) VALUES
(0, 'no-script'),
(1, 'JavaScript'),
(2, 'Templated JS');

TRUNCATE TABLE `session`;
TRUNCATE TABLE `sessioncontent`;
TRUNCATE TABLE `string`;
TRUNCATE TABLE `stringgroup`;
INSERT INTO `stringgroup` (`ID`, `name`) VALUES
(1, 'menu'),
(2, 'form');

TRUNCATE TABLE `upload`;
INSERT INTO `upload` (`ID`, `name`, `fileName`, `uploadTime`, `lastModified`, `mimeType`, `cache`, `ttc`, `accessKey`, `hash`, `size`, `compressedSize`) VALUES
(1, 'css_normalize', 'normalize.css', 0, 0, 1, 1, 604800, 0, '9e959023c66cd35d5459b3d342b57ba7', 8130, 8130),
(2, 'css_main', 'main.css', 0, 0, 1, 1, 604800, 0, 'e833cf3d87dc8a3b4d41eb70c5b5273d', 6006, 6006),
(4, 'js_jquery', 'jquery-2.1.4.min.js', 0, 0, 2, 1, 604800, 0, 'b0dc11d0a434aafe88908c7f33d71095', 84349, 84349),
(5, 'font_fa_eot', 'fontawesome-webfont.eot', 0, 0, 3, 1, 604800, 0, '', 0, 0),
(6, 'font_fa_woff2', 'fontawesome-webfont.woff2', 0, 0, 4, 1, 604800, 0, '4b5a84aaf1c9485e060c503a0ff8cadb', 64464, 64464),
(7, 'font_fa_woff', 'fontawesome-webfont.woff', 0, 0, 5, 1, 604800, 0, 'dfb02f8f6d0cedc009ee5887cc68f1f3', 81284, 81284),
(8, 'font_fa_ttf', 'fontawesome-webfont.ttf', 0, 0, 6, 1, 604800, 0, '', 0, 0),
(9, 'font_fa_svg', 'fontawesome-webfont.svg', 0, 0, 7, 1, 604800, 0, '', 0, 0),
(10, 'css_fa', 'font-awesome.min.css', 0, 0, 1, 1, 604800, 0, '33d6d15771c3f3358e2445ce75596fe9', 26224, 26224),
(13, 'js_rws', 'reconnecting-websocket.js', 0, 0, 2, 1, 604800, 0, '7e23ddc9709974b7571fb7e529f6b805', 14794, 14794),
(14, 'js_pace', 'pace.min.js', 0, 0, 2, 1, 604800, 0, 'fe9335c2fc28b9581b35f61b55d88417', 12508, 12508),
(15, 'css_pace', 'pace-style.css', 0, 0, 1, 1, 604800, 0, 'a27e8095515c10075f6f7a53ef217d6c', 355, 355),
(16, 'js_shim-shadowdom', 'ShadowDOM.min.js', 0, 0, 2, 1, 604800, 0, '5c6669a4628df199a668289da1008bb9', 71254, 71254),
(17, 'js_polymer', 'webcomponents-lite.min.js', 0, 0, 2, 1, 604800, 0, '6f330bc98ffdf50858d81b5e88fc6c60', 38976, 38976),
(24, 'js_gui_interaction', 'GUI/interaction.js', 0, 0, 2, 0, 604800, 0, '5c6535c6c55efdc378b30492d0c501b7', 2572, 2572),
(23, 'js_gui_init', 'GUI/init.js', 0, 0, 2, 0, 604800, 0, 'd4e3bad25f4c0c9ea2be6f194826e4a3', 1125, 1125),
(22, 'js_gui_comm', 'GUI/comm.js', 0, 0, 2, 0, 604800, 0, '13dec27409ca7dd6c338add97a4efb0f', 728, 728),
(21, 'js_gui', 'SHPS-GUI.js', 0, 1458132758, 2, 0, 604800, 0, 'f4f7162a7932d75d0875dcb51313a515', 49, 49),
(25, 'js_gui_util', 'GUI/util.js', 0, 0, 2, 0, 604800, 0, '2b11567686985f6832e5e367a2061b3a', 372, 372);

TRUNCATE TABLE `user`;
INSERT INTO `user` (`ID`, `user`, `email`, `pass`, `salt`, `host`, `regDate`, `token`, `lastIP`, `lastActivity`, `isLoggedIn`, `lastSID`, `isLocked`, `autoLoginToken`, `xForward`, `uaInfo`) VALUES
(13, 'test', 'test', '$2a$11$ydzoauAkb2fB2hd/1zOKW.xP2SPfuJz5vMHP2eOfBzIm20.TRvY.m', '', '::1', 1458146302, '', '::1', 1458228396, 0, '', 0, 'GBsOH00Zi+lXEH+bstwn4SZoP8E=', '', 0);

TRUNCATE TABLE `usersecurity`;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
