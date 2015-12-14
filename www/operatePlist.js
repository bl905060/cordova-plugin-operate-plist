module.exports = {
    user_id : '',
    
    org_id : '',
    
    copy : function(fileName, successCallback, errorCallback){
        cordova.exec(successCallback,
                     errorCallback,
                     "operatePlist",
                     "copyPlist",
                     [fileName]);
    },
    
    read : function(handler1, handler2, handler3) {
        var that = this;
        var flag = 0;
        if (typeof(handler1) !== "string") {
            fileName = "userinfo";
        }
        else {
            fileName = handler1;
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
                handler1(results);
            }
            else {
                handler2(results);
            }
        }
        
        function errorHandler() {
            if (flag) {
                handler2(results);
            }
            else {
                handler3(results);
            }

        }
    },
    
    write : function(handler1, handler2, handler3, handler4) {
        var flag = 0;
        if (typeof(handler1) !== "string") {
            fileName = "userinfo";
            info = handler1;
            flag = 1;
        }
        else {
            fileName = handler1;
            info = handler2;
        }
        
        cordova.exec(successHandler,
                     errorHandler,
                     "operatePlist",
                     "writePlist",
                     [fileName, info]);
        
        function successHandler () {
            if (flag) {
                handler2();
            }
            else {
                handler3();
            }
        }
        
        function errorHandler () {
            if (flag) {
                handler3();
            }
            else {
                handler4();
            }
        }
    }
};