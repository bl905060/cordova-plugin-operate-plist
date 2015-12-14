##cordova-plugin-operate-plist

**Cordova / PhoneGap 读写Plist文件插件**：具备读、写、拷贝Plist文件功能

## 安装

#### 从Github安装最新版本

```
cordova plugin add https://github.com/bl905060/cordova-plugin-operate-plist.git
```

## 使用

### 写入Plist文件

```js
//创建需要写入的内容
var userinfo = {
    "user_id" : responseData.user_id,
    "user_mobile" : responseData.user_mobile,
    "user_email" : responseData.user_email,
    "org_id" : responseData.org_id
};

//传入文件名以及需要写入的对象
operatePlist.write("userinfo", userinfo);

//只传入需要写入的对象则默认写入userinfo.plist文件
operatePlist.write(userinfo);
```

### 读取Plist文件

```js
//传入需要读取的Plist文件的文件名，以及成功回调函数
operatePlist.read("userinfo", readSuccess, readFail);

//只传入回调函数则默认读取userinfo.plist文件
operatePlist.read(readSuccess, readFail);

function readSuccess(responseData) {
    alert(responseData.user_id);
    alert(responseData.user_mobile);
    alert(responseData.user_email);
    alert(responseData.org_id);
}
```

### 拷贝Plist文件

```js
//初始化时将www文件夹中指定的Plist文件拷贝至Library目录中，可在该Plist中写入初始化信息
operatePlist.copy("userinfo");
```

## 平台支持

iOS (7+) only.

