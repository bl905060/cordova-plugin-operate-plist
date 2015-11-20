module.exports = {
    user_id : '',
    
    org_id : '',
    
    read : function(fileName, Callback, errorCallback) {
        var that = this;
        
        cordova.exec(successCallback,
                     errorCallback,
                     "operatePlist",
                     "readPlist",
                     [fileName]);
        
        function successCallback(results) {
            
            if (results.user_id != undefined) {
                that.user_id = results.user_id;
            }
            if (results.org_id != undefined) {
                that.org_id = results.org_id;
            }
            Callback(results);
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