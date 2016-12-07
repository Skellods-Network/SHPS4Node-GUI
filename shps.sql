SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


TRUNCATE TABLE `accesskey`;
INSERT INTO `accesskey` (`ID`, `name`, `description`) VALUES
(0, 'SYS_NULL', 'Every user/guest has this access key. Always.');

TRUNCATE TABLE `content`;
INSERT INTO `content` (`ID`, `name`, `content`, `namespace`, `language`, `accessKey`, `tls`, `extSB`) VALUES
(1, 'index', 'const d = require(\'q\').defer();\\n\\nauth.isLoggedIn().done($r => {\\n\\n  if ($r) {\\n\\n    d.resolve(`<meta http-equiv=\"refresh\" content=\"0;URL=\'${cl.getURL(\'app\').url}\'\">`);\\n  }\\n  else {\\n\\n    sql.newSQL(\'usermanagement\').done($sql => {\\n\\n      const tbl = $sql.openTable(\'user\');\\n      $sql.query()\\n        .get(tbl.col(\'ID\'))\\n        .execute()\\n        .done($res => {\\n\\n          if ($res.length > 0) {\\n\\n            d.resolve(`<meta http-equiv=\"refresh\" content=\"0;URL=\'${cl.getURL(\'login\').url}\'\">`);\\n          }\\n          else {\\n\\n            d.resolve(`<meta http-equiv=\"refresh\" content=\"0;URL=\'${cl.getURL(\'register\').url}\'\">`);\\n          }\\n        }, d.reject);\\n      \\n    }, d.reject);\\n  }\\n}, d.reject); //TODO: generate useful error output\\n\\nd.promise;', 0, 1, 0, 0, 1),
(2, 'login', 'const d = require(\'q\').defer();\\r\\n\\r\\nlang.getStrings(\'login\').done($strs => {\\r\\n\\r\\nd.resolve(`\\r\\n<div class=\"u-flex__col-center u-fullscreen\">\\r\\n  <div class=\"u-flex__row-center\">\\r\\n    <form class=\"c-login o-form\">\\r\\n      <h1 class=\"o-form__heading\">${$strs[\'login\']}</h1>\\r\\n      <label class=\"o-form__element\">${$strs[\'user\']}<br>\\r\\n        <input type=text placeholder=\"${$strs[\'username\']}\" name=user class=\"o-input o-form__input / js-user\" required>\\r\\n      </label>\\r\\n      <label class=\"o-form__element\">${$strs[\'password\']}<br>\\r\\n        <input type=password placeholder=\"${$strs[\'password\']}\" name=password class=\"o-input o-form__input / js-password\" required>\\r\\n      </label>\\r\\n      <div class=\"o-form__element o-form__buttons\">\\r\\n        <button type=button class=\"o-form__button\">${$strs[\'show_pw\']}</button>\\r\\n        <button type=button action=login class=\"o-form__button / js-submit\">${$strs[\'login\']}</button>\\r\\n      </div>\\r\\n    </form>\\r\\n  </div>\\r\\n</div>\\r\\n`);\\r\\n}, d.reject);\\r\\n\\r\\nd.promise;\\r\\n', 0, 1, 0, 0, 1),
(3, 'register', 'const d = require(\'q\').defer();\\r\\n\\r\\nlang.getStrings(\'login\').done($strs => {\\r\\n\\r\\nd.resolve(`\\r\\n<div class=\"u-flex__col-center u-fullscreen\">\\r\\n  <div class=\"u-flex__row-center\">\\r\\n    <form class=\"c-register o-form\">\\r\\n      <h1 class=\"o-form__heading\">${$strs[\'register\']}</h1>\\r\\n      <label class=\"o-form__element\">${$strs[\'username\']}<br>\\r\\n        <input type=text placeholder=\"${$strs[\'username\']}\" name=username class=\"o-input o-form__input / js-user\" required>\\r\\n      </label>\\r\\n      <label class=\"o-form__element\">${$strs[\'email\']}<br>\\r\\n        <input type=email placeholder=\"${$strs[\'email\']}\" name=mail class=\"o-input o-form__input / js-mail\" required>\\r\\n      </label>\\r\\n      <label type=password class=\"o-form__element\">${$strs[\'password\']}<br>\\r\\n        <input type=password placeholder=\"${$strs[\'password\']}\" name=password class=\"o-input o-form__input / js-password\" required>\\r\\n      </label>\\r\\n      <div class=\"o-form__element o-form__buttons\">\\r\\n        <button type=button class=\"o-form__button / js-showPW\">${$strs[\'show_pw\']}</button>\\r\\n        <button action=register type=button class=\"o-form__button / js-submit\">${$strs[\'register\']}</button>\\r\\n      </div>\\r\\n    </form>\\r\\n  </div>\\r\\n</div>\\r\\n`);\\r\\n}, d.reject);\\r\\n\\r\\nd.promise;\\r\\n', 0, 1, 0, 0, 1);

TRUNCATE TABLE `css`;
INSERT INTO `css` (`ID`, `name`, `content`, `comment`, `namespace`, `language`, `mediaquery`, `layer`) VALUES
(1, '*', 'position: relative;', '', 0, 0, 0, 0),
(2, '.u-flex__row-center', 'display: flex;\\r\\nflex-direction: row;\\r\\njustify-content: center;', '', 0, 0, 0, 1),
(3, '.u-flex__col-center', 'display: flex;\\r\\nflex-direction: column;\\r\\njustify-content: center;', '', 0, 0, 0, 1),
(4, '.u-fullscreen', 'width: 100vw;\\r\\nheight: 100vh;', '', 0, 0, 0, 1),
(5, '.c-login', 'width: 400px;\\nmargin-top: -100px;\\npadding-bottom: 50px;', '', 0, 0, 0, 4),
(6, '.o-form__element', 'display: block;\\nwidth: 100%;\\nmargin-top: 10px;', '', 0, 0, 0, 3),
(7, '.o-form__input', 'width: calc(100% - 24px);\\nmargin: 5px;\\npadding: 5px;\\nborder-width: 2px;\\n', '', 0, 0, 0, 3),
(8, '.o-form', 'outline: solid 1px;\\nbox-shadow: 0px 0px 3px 1px rgba(0,0,0,0.75);\\npadding: 5px;', '', 0, 0, 0, 3),
(9, '.t-dark .o-form', 'outline-color: hsl(0,0%,40%);\\nbackground-color: hsl(0,0%,20%);', '', 0, 0, 0, 3),
(10, '.o-form__buttons', 'display: flex;\\nflex-direction: row;\\njustify-content: flex-end;\\nborder-top: solid 1px;\\npadding-top: 10px;', '', 0, 0, 0, 3),
(11, '.c-register', 'width: 400px;\\nmargin-top: -100px;\\npadding-bottom: 50px;', '', 0, 0, 0, 4),
(12, 'noscript', 'z-index: 99999;\\r\\nbackground-color: #d55;\\r\\nfont-size: 300%;\\r\\nwidth: 100%;\\r\\nheight: 100%;\\r\\nposition: absolute;\\r\\ntop: 0px;\\r\\nleft: 0px;\\r\\ndisplay: block;', 'with legacy CSS~', 0, 0, 0, 5),
(13, '.t-dark .o-form__button', 'color: hsl(0,0%,90%);\\nbackground-color: hsl(0,0%,40%);\\nborder: none;\\nmargin: 5px;\\npadding: 5px;\\ncursor: pointer;', '', 0, 0, 0, 3),
(14, '.t-dark', 'color: hsl(0,0%,80%);\\r\\nbackground-color: hsl(0,0%,10%);', '', 0, 0, 0, 3),
(15, '.t-dark .o-form__input', 'background-color: hsl(0,0%,30%);\\ncolor: hsl(0,0%,90%);\\nborder: none;', '', 0, 0, 0, 3),
(16, '.t-dark .o-form__input:focus', 'background-color: hsl(0,0%,40%);\\r\\ncolor: hsl(0,0%,100%);', '', 0, 0, 0, 3),
(17, '.t-dark .o-form__input:hover', 'background-color: hsl(0,0%,35%);', '', 0, 0, 0, 3),
(18, '.t-dark .o-form__button:hover', 'background-color: hsl(0,50%,40%);\\r\\n', '', 0, 0, 0, 3),
(19, '.c-topmenu', 'width: 100vw;\\r\\nheight: 50px;\\r\\ndisplay: flex;\\r\\nflex-direction: row;\\r\\njustify-content: flex-end;', '', 0, 0, 0, 4),
(20, '.t-dark .c-topmenu', 'background-color: hsl(0,50%,40%);\\r\\n', '', 0, 0, 0, 4),
(21, '.c-leftsidemenu', 'width: 200px;\\nheight: calc(100vh - 50px);\\nposition: absolute;\\nleft: 0px;\\ntop: 50px;', '', 0, 0, 0, 4),
(22, '.t-dark .c-leftsidemenu', 'background-color: hsl(0,0%,20%);', '', 0, 0, 0, 4),
(23, '.c-desktop', 'position: absolute;\\r\\ntop: 50px;\\r\\nleft: 200px;', '', 0, 0, 0, 4),
(24, '*', 'margin: 0;\\r\\npadding: 0;\\r\\nborder: 0;', '', 0, 0, 0, 0),
(25, '.o-topmenu__item', 'height: calc(100% - 6px);\\r\\npadding: 3px;\\r\\nwidth: 100px;\\r\\n\\r\\n', '', 0, 0, 0, 3),
(26, '.t-dark .o-menu__item', 'transition-property: all;\\r\\ntransition-duration: .2s;', '', 0, 0, 0, 3),
(27, '.t-dark .o-topmenu__item:hover', 'background-color: hsl(0,50%,60%);', '', 0, 0, 0, 3),
(28, '.o-menu__item', 'list-style: none;\\njustify-content: center;\\ndisplay: flex;\\nflex-direction: column;\\nvertical-align: middle;\\ntext-align: center;\\ncursor: pointer;\\n\\n\\n  -webkit-touch-callout: none; /* iOS Safari */\\n    -webkit-user-select: none; /* Chrome/Safari/Opera */\\n     -khtml-user-select: none; /* Konqueror */\\n       -moz-user-select: none; /* Firefox */\\n        -ms-user-select: none; /* Internet Explorer/Edge */\\n            user-select: none; /* Non-prefixed version, currently\\n                                  not supported by any browser */', '', 0, 0, 0, 3),
(29, '.o-leftsidemenu__item', 'width: calc(100% - 6px);\\r\\nheight: 30px;\\r\\npadding: 3px;', '', 0, 0, 0, 3),
(30, '.t-dark .o-leftsidemenu__item:hover', 'background-color: hsl(0,0%,40%);', '', 0, 0, 0, 3);

TRUNCATE TABLE `csslayer`;
INSERT INTO `csslayer` (`ID`, `name`, `order`) VALUES
(0, 'default', 0),
(1, 'Generic', 1),
(2, 'Elements', 2),
(3, 'Objects', 3),
(4, 'Components', 4),
(5, 'Trumps', 5);

TRUNCATE TABLE `filetype`;
INSERT INTO `filetype` (`ID`, `name`, `mimeType`) VALUES
(1, 'css', 0),
(2, 'js', 0),
(3, 'coffee', 0);

TRUNCATE TABLE `group`;
TRUNCATE TABLE `groupsecurity`;
TRUNCATE TABLE `groupuser`;
TRUNCATE TABLE `include`;
INSERT INTO `include` (`file`, `fileType`, `namespace`) VALUES
(1, 1, 0),
(2, 2, 0),
(3, 2, 0);

TRUNCATE TABLE `language`;
INSERT INTO `language` (`ID`, `name`) VALUES
(1, 'en');

TRUNCATE TABLE `log`;
TRUNCATE TABLE `loginquery`;
INSERT INTO `loginquery` (`uid`, `time`) VALUES
(1, 1478701132),
(2, 1478773797);

TRUNCATE TABLE `loglevel`;
TRUNCATE TABLE `mediaquery`;
TRUNCATE TABLE `mimetype`;
INSERT INTO `mimetype` (`ID`, `name`) VALUES
(1, 'text/css'),
(2, 'application/javascript');

TRUNCATE TABLE `namespace`;
INSERT INTO `namespace` (`ID`, `name`) VALUES
(0, 'default');

TRUNCATE TABLE `oldpassword`;
TRUNCATE TABLE `partial`;
INSERT INTO `partial` (`ID`, `name`, `language`, `content`, `namespace`, `accesskey`, `extSB`) VALUES
(1, 'site', 0, '<!DOCTYPE HTML>\\n<html class=\"t-dark\" lang=en>\\n{$head}\\n<body>\\n  {$noscript}\\n  <div id=content>{$body}</div>\\n  {$js}\\n', 0, 0, 0),
(2, 'head', 0, '<title>SHPS GUI</title>\\r\\n{$css}\\r\\n\\r\\n', 0, 0, 0),
(3, 'noscript', 0, '<noscript>\\r\\n<strong>Please activate JavaScript in order to use this Admin Panel!</strong>\\r\\n</noscript>', 0, 0, 0),
(4, 'app', 0, '{$topmenu}\\n{$leftsidemenu}\\n<div class=\"c-desktop\" id=desktop>{$welcome}</div>\\n', 0, 0, 0),
(5, 'topmenu', 0, '<ul class=\"c-topmenu / js-menu\">\\r\\n  <li class=\"o-topmenu__item o-menu__item / js-menu__item\" action=reload>Reload App\\r\\n  <li class=\"o-topmenu__item o-menu__item / js-menu__item\" action=logout>Logout\\r\\n</ul>\\r\\n', 0, 0, 0),
(6, 'leftsidemenu', 0, '<ul class=\"c-leftsidemenu / js-menu\">\\r\\n  <li class=\"o-leftsidemenu__item o-menu__item / js-menu__item\" click-action=cd action-target=app-edit-css>Edit CSS\\r\\n  <li class=\"o-leftsidemenu__item o-menu__item / js-menu__item\" click-action=cd action-target=app-edit-contents>Edit Contents\\r\\n  <li class=\"o-leftsidemenu__item o-menu__item / js-menu__item\" click-action=cd action-target=app-edit-partials>Edit Partials\\r\\n</ul>', 0, 0, 0),
(7, 'welcome', 0, 'Here some welcome text and graphics and tutorial w/e :D', 0, 0, 0),
(8, 'app-edit-css', 0, '<div class=\"c-css\">\\r\\n  CSS HERE\\r\\n</div>', 0, 0, 0),
(9, 'app-edit-contents', 0, 'EDIT CONTENTS HERE', 0, 0, 0),
(10, 'app-edit-partials', 0, 'EDIT PARTIALS HERE', 0, 0, 0);

TRUNCATE TABLE `passquery`;
INSERT INTO `passquery` (`pass`, `time`) VALUES
('me', 1478773797),
('y', 1478703652),
('x', 1478705660),
('', 1478706263);

TRUNCATE TABLE `plugin`;
TRUNCATE TABLE `request`;
TRUNCATE TABLE `scriptlanguage`;
INSERT INTO `scriptlanguage` (`ID`, `name`) VALUES
(0, 'plain'),
(1, 'javascript'),
(2, 'embedded javascript');

TRUNCATE TABLE `session`;
TRUNCATE TABLE `sessioncontent`;
TRUNCATE TABLE `string`;
INSERT INTO `string` (`ID`, `langID`, `namespace`, `group`, `key`, `value`) VALUES
(1, 1, 0, 1, 'user', 'Username / EMail'),
(2, 1, 0, 1, 'password', 'Passphrase (for example \"whatdoesthefoxsay??\")'),
(3, 1, 0, 1, 'login', 'Login'),
(4, 1, 0, 1, 'username', 'Username'),
(5, 1, 0, 1, 'register', 'Register'),
(6, 1, 0, 1, 'email', 'EMail'),
(7, 1, 0, 1, 'show_pw', 'Display Password');

TRUNCATE TABLE `stringgroup`;
INSERT INTO `stringgroup` (`ID`, `name`) VALUES
(1, 'login');

TRUNCATE TABLE `upload`;
INSERT INTO `upload` (`ID`, `name`, `fileName`, `uploadTime`, `lastModified`, `mimeType`, `cache`, `ttc`, `accessKey`, `hash`, `size`, `compressedSize`, `dataRoot`) VALUES
(1, 'css_normalize', 'normalize.css', 1478620134, 1478620134, 1, 1, 604800, 0, '934e11a04762ee86e8181a50912a0635', 8514, 8514, '/pool'),
(2, 'js_rws', 'reconnecting-websocket.js', 1478620134, 1478620134, 2, 1, 604800, 0, '7e23ddc9709974b7571fb7e529f6b805', 14794, 14794, '/pool'),
(3, 'js_gui', 'shps-gui.js', 1478620134, 1478620134, 2, 1, 604800, 0, '13680fc80fe02331a973c957484146f9', 4620, 4620, '/pool');

TRUNCATE TABLE `user`;
INSERT INTO `user` (`ID`, `user`, `email`, `pass`, `host`, `regDate`, `token`, `lastIP`, `lastActivity`, `isLoggedIn`, `lastSID`, `isLocked`, `autoLoginToken`) VALUES
(2, 'me', 'me@marco-alka.de', '$2a$12$0HfoWXl2VYdZmSJ6WBbqD.378l85WPvkqnlyzLH8OSLBa1ap2P4AG', '::1', 1478701592, '', '::1', 1478773798, 1, '', 0, 'UovmUUDZVMu93CmLilKp5xR6nT0=');

TRUNCATE TABLE `usersecurity`;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
