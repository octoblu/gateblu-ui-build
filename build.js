var NwBuilder = require('node-webkit-builder');
var nw = new NwBuilder({
    files: ['gateblu-ui/**', '!build/**', '!cache/**'], // use the glob format
    platforms: ['win', 'osx', 'linux32', 'linux64'],
    appName: 'Gateblu',
    appVersion: '1.5.1',
    macIcns: './icons/gateblu.icns',
    version: '0.10.5'
});

// Log stuff you want
nw.on('log',  console.log);

// Build returns a promise
nw.build().then(function () {
   console.log('all done!');
}).catch(function (error) {
    console.error(error);
});

// And supports callbacks
nw.build(function(err) {
    if(err) console.log(err);
})

