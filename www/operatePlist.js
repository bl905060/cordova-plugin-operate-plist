module.exports = {
    user_id : '',
    
    org_id : '',
    
    read : function(fileName, successCallback, errorCallback) {
        /*var photoURL = new Array();
         var voiceURL = new Array();
         
         if ((postData.photoURL != undefined) && (postData.photoURL.length > 0)) {
         photoURL = postData.photoURL;
         }
         if ((postData.voiceURL != undefined) && (postData.voiceURL.length > 0)) {
         voiceURL = postData.voiceURL;
         }*/
        
        //alert("photoURL length: " + postData.photoURL.length);
        //alert("photoURL: " + postData.photoURL);
        //alert("voiceURL length: " + postData.voiceURL.length);
        //alert("voiceURL: " + postData.voiceURL);
        
        //postData.photoURL = undefined;
        //postData.voiceURL = undefined;
        
        cordova.exec(callback,
                     errorCallback,
                     "operatePlist",
                     "readPlist",
                     [fileName]);
        
        function callback(results) {
            this.user_id = results.user_id;
            this.org_id = results.org_id;
            successCallback(results);
        }
    },
    
    write : function(fileName, info, successCallback, errorCallback) {
        cordova.exec(successCallback,
                     errorCallback,
                     "operatePlist",
                     "writePlist",
                     [fileName, info]);
    }
};