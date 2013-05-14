(function (window) {
 "use strict";

 window.handleOpenURL = function (url) {
    console.log('Got data');
    console.log(url);
    var data = getQueryVariable(url, 'data');
    console.log(data);
    document.getElementById('dataText').innerHTML = data;
    var returnUrl = getQueryVariable(url, 'r');
    document.getElementById('returnUrl').innerHTML = returnUrl;
 };

 window.done = function () {
    console.log('Send data');
    var data = document.getElementById('dataText').innerHTML;
    var returnUrl = document.getElementById('returnUrl').innerHTML;
    cordova.exec(function() {
            console.log('Done sending');
         }, function() {
            console.log('Fail');
         }, "CallbackToUrl", "callbackToUrl", [returnUrl, data]);
 }

 var getQueryVariable = function (url, variable) {
    var query = url.split('?', 2)[1];
    var vars = query.split('&');
    for(var i = 0; i < vars.length; ++i) {
        var pair = vars[i].split('=', 2);
        if (decodeURIComponent(pair[0]) === variable) {
            return decodeURIComponent(pair[1]);
        }
    }
 };

})(window);