var appVersion = require('./gateblu-ui/package.json').version;

var NwBuilder = require('node-webkit-builder');
var nw = new NwBuilder({
    files: ['gateblu-ui/**', '!build/**', '!cache/**'], // use the glob format
    platforms: ['win', 'osx', 'linux'],
    appName: 'Gateblu',
    appVersion: appVersion,
    macIcns: './icons/gateblu.icns',
    version: '0.11.5'
});

// Log stuff you want
nw.on('log',  console.log);

// Build returns a promise
nw.build().then(function () {
   console.log('all done!');
}).catch(function (error) {
    console.error(error);
});
