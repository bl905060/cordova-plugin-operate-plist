module.exports = {
    user_id : '',
    
    org_id : '',
    
    copy : function(fileName, successHandler, errorHandler){
        cordova.exec(successHandler,
                     errorHandler,
                     "operatePlist",
                     "copyPlist",
                     [fileName]);
    },
    
    read : function(param1, param2, param3) {
        var that = this;
        var flag = 0;
        if (typeof(param1) !== "string") {
            fileName = "userinfo";
            flag = 1;
        }
        else {
            fileName = param1;
        }
        
        cordova.exec(successHandler,
                     errorHandler,
                     "operatePlist",
                     "readPlist",
                     [fileName]);
        
        function successHandler(results) {
            if (results.user_id != undefined) {
                that.user_id = results.user_id;
            }
            if (results.org_id != undefined) {
                that.org_id = results.org_id;
            }
            if (flag) {
                param1(results);
            }
            else {
                param2(results);
            }
        }
        
        function errorHandler() {
            if (flag) {
                param2();
            }
            else {
                param3();
            }

        }
    },
    
    write : function(param1, param2, param3, param4) {
        var flag = 0;
        if (typeof(param1) !== "string") {
            fileName = "userinfo";
            info = param1;
            flag = 1;
        }
        else {
            fileName = param1;
            info = param2;
        }
        
        cordova.exec(successHandler,
                     errorHandler,
                     "operatePlist",
                     "writePlist",
                     [fileName, info]);
        
        function successHandler () {
            if (flag) {
                param2();
            }
            else {
                param3();
            }
        }
        
        function errorHandler () {
            if (flag) {
                param3();
            }
            else {
                param4();
            }
        }
    }
};