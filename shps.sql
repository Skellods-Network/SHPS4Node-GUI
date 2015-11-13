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
(8, '.t-default__body', 'background-color: hsl(0,0%,15%);', '', 0, 0, 0);

TRUNCATE TABLE `filetype`;
INSERT INTO `filetype` (`ID`, `name`, `mimeType`) VALUES
(1, 'css', 1),
(2, 'js', 2);

TRUNCATE TABLE `group`;
INSERT INTO `group` (`ID`, `name`) VALUES
(1, 'admin');

TRUNCATE TABLE `groupsecurity`;
TRUNCATE TABLE `groupuser`;
TRUNCATE TABLE `include`;
INSERT INTO `include` (`file`, `fileType`, `namespace`) VALUES
(1, 1, 0),
(2, 1, 0),
(4, 2, 0),
(10, 1, 0),
(13, 2, 0),
(14, 2, 0),
(15, 1, 0),
(16, 2, 0),
(17, 2, 0);

TRUNCATE TABLE `language`;
INSERT INTO `language` (`ID`, `name`) VALUES
(0, 'en');

TRUNCATE TABLE `log`;
TRUNCATE TABLE `loginquery`;
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
(1, 'site', 0, '<!DOCTYPE HTML>\n\n<title>SHPS GUI</title>\n<style type="text/css">\n* {\n  margin: 0;\n  padding: 0;\n  border: 0;\n  position: relative;\n  z-index: 0;\n}\n</style>\n\n{$css}\n{$elements}\n\n<body class="t-default__body">\n\n{$menubar}\n{$sidemenu}\n{$body}\n\n{$js}', 0, 0, 0),
(2, 'test', 0, 'TEST ELEMENT', 1, 0, 0),
(3, 'menubar', 0, '<!-- <div class="c-menubar / t-default__menubar">\r\n  <span class="fa fa-bars fa-2x / js-interact-menu__show-sidemenu / u-clickable u-clickable--no-shadow"></span>\r\n</div> -->\r\n<paper-toolbar>\r\n  <paper-icon-button icon="menu" on-tap="menuAction"></paper-icon-button>\r\n  <div class="title">Title</div>\r\n</paper-toolbar>', 0, 0, 0),
(4, 'sidemenu', 0, '<div class="c-sidemenu">\r\n\r\n</div>', 0, 0, 0),
(6, 'elements', 0, '<link rel="import" href="https://cdn.rawgit.com/download/polymer-cdn/1.0.1/lib/paper-toolbar/paper-toolbar.html">', 0, 0, 0);

TRUNCATE TABLE `passquery`;
TRUNCATE TABLE `plugin`;
INSERT INTO `plugin` (`GUID`, `name`, `namespace`, `status`, `accessKey`, `order`) VALUES
('334b0f33-8a07-11e5-8000-801934e9dffd', 'SHPS4Node-GUI', 0, 3, 0, 0);

TRUNCATE TABLE `request`;
INSERT INTO `request` (`name`, `script`, `language`, `accessKey`, `namespace`, `tls`, `extSB`) VALUES
('getElement', '// Let''s make a Promise to conveniently return a result and script status to SHPS\r\nnew Promise(($res, $rej) => {\r\n\r\n  if (!GET.element) {\r\n  \r\n    $rej(''No element specified!'');\r\n  }\r\n  else {\r\n  \r\n    // Let''s retrive a free SQL connection to the `default` alias from the connection pool\r\n    sql.newSQL().then($sql => {\r\n  \r\n      var tblNS = $sql.openTable(''namespace'');\r\n      var tblPart = $sql.openTable(''partial'');\r\n  \r\n      // And then specify what we want to get, how the tables are connected and which selection criteria we want to use\r\n      // For security purposes, this request script should only be able to return actual elements, so we put all elements into one namespace and only allow partials from that one namespace\r\n      $sql.query()\r\n        .get([tblPart.col(''content'')])\r\n        .fulfilling()\r\n        .eq(tblNS.col(''ID''), tblPart.col(''namespace''))\r\n        .eq(tblNS.col(''name''), ''element'')\r\n        .eq(tblPart.col(''name''), GET.element)\r\n        .execute()\r\n        .then($rows => {\r\n  \r\n          if ($rows.length <= 0) {\r\n  \r\n            $rej(''No element `'' + GET.element + ''` found!'');\r\n          }\r\n          else {\r\n  \r\n            $res($rows[0].content);\r\n          }\r\n        });\r\n    });\r\n  }\r\n});', 1, 0, 0, 0, 0);

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
(4, 'js_jquery', 'jquery-2.1.4.min.js', 0, 0, 2, 1, 604800, 0, 'f9c7afd05729f10f55b689f36bb20172', 84345, 84345),
(5, 'font_fa_eot', 'fontawesome-webfont.eot', 0, 0, 3, 1, 604800, 0, '', 0, 0),
(6, 'font_fa_woff2', 'fontawesome-webfont.woff2', 0, 0, 4, 1, 604800, 0, '4b5a84aaf1c9485e060c503a0ff8cadb', 64464, 64464),
(7, 'font_fa_woff', 'fontawesome-webfont.woff', 0, 0, 5, 1, 604800, 0, 'dfb02f8f6d0cedc009ee5887cc68f1f3', 81284, 81284),
(8, 'font_fa_ttf', 'fontawesome-webfont.ttf', 0, 0, 6, 1, 604800, 0, '', 0, 0),
(9, 'font_fa_svg', 'fontawesome-webfont.svg', 0, 0, 7, 1, 604800, 0, '', 0, 0),
(10, 'css_fa', 'font-awesome.min.css', 0, 0, 1, 1, 604800, 0, '108077390159375d13de7b820221d8a6', 26220, 26220),
(13, 'js_rws', 'reconnecting-websocket.js', 0, 0, 2, 1, 604800, 0, '7e23ddc9709974b7571fb7e529f6b805', 14794, 14794),
(14, 'js_pace', 'pace.min.js', 0, 0, 2, 1, 604800, 0, '24d2d5e3e331c4efa3cda1e1851b31a7', 12507, 12507),
(15, 'css_pace', 'pace-style.css', 0, 0, 1, 1, 604800, 0, 'f4b4cacac1c52820608b0275fa256f36', 336, 336),
(16, 'js_shim-shadowdom', 'ShadowDOM.min.js', 0, 0, 2, 1, 604800, 0, '5c6669a4628df199a668289da1008bb9', 71254, 71254),
(17, 'js_polymer', 'webcomponents-lite.min.js', 0, 0, 2, 1, 604800, 0, '940384b4e01725e7d410505b0c7ef991', 38965, 38965);

TRUNCATE TABLE `user`;
TRUNCATE TABLE `usersecurity`;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
