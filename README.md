# Push.README

## 功能介绍
本 Demo 主要配合官网 [消息推送](https://help.aliyun.com/document_detail/49586.html)，介绍 iOS 消息推送的使用，功能如下：

- 接收系统推送 deviceToken，绑定 userid 和 deviceToken
- 消息接收回调处理

本 Demo 支持的基线范围：>= 10.1.60

## 运行Demo
### Cocoa Pod 接入：MPPushDemo_pod

1. 执行以下命令，安装 cocoapods-mPaaS 插件 
```shell
sh <(curl -s http://mpaas-ios.oss-cn-hangzhou.aliyuncs.com/cocoapods/installmPaaSCocoaPodsPlugin.sh)
```

2. 修改Podfile，设置基线号，支持设置为 10.1.60、10.1.68-beta

![image.png](https://intranetproxy.alipay.com/skylark/lark/0/2020/png/271/1584683006252-99eb78eb-c84c-4e70-965b-16677a837aa7.png#align=left&display=inline&height=203&name=image.png&originHeight=406&originWidth=1332&size=178450&status=done&style=none&width=666)

3. 执行以下命令，拉取依赖库
```shell
1、pod mpaas update --all
2、pod update
```

4. 直接打开workspace文件，您就可以运行此 demo了
4. 此 demo 默认连接 mPaaS 公有云的 Demo应用，若您需切换到您自己的 App，请替换 [meta.config 文件](https://tech.antfin.com/docs/2/87321#h2-u4E0Bu8F7Du914Du7F6Eu6587u4EF63)后，重新 pod update

### Extension 插件接入

1. 执行以下命令，安装 mPaaS Extension插件，并确认插件版本 >= 1.1.3
```shell
curl -sSL https://mpaas-ios.oss-cn-hangzhou.aliyuncs.com/mpaaskit/Xcode-extension/install.sh | sh
```

2. 点击 “Xcode - Editor - mPaaS - 编辑工程 ” 打开插件面板，切换到“工程概览” TAB，点击安装按钮，拉取依赖

![image.png](https://intranetproxy.alipay.com/skylark/lark/0/2020/png/271/1584697775625-1dd4eddb-a546-47e7-936d-64bf47d3869c.png#align=left&display=inline&height=301&name=image.png&originHeight=1202&originWidth=1800&size=572760&status=done&style=none&width=450)

3. 此 demo 默认为 10.1.60基线，您可以切换到 “升级基线” Tab，选择需要的基线

![image.png](https://intranetproxy.alipay.com/skylark/lark/0/2020/png/271/1584697976214-dcac8f48-58ad-4d74-9f32-cc65a6825780.png#align=left&display=inline&height=301&name=image.png&originHeight=1202&originWidth=1800&size=649170&status=done&style=none&width=450)

4. 直接打开 project 文件，您就可以运行此 demo了
4. 此 demo 默认连接 mPaaS 公有云的 Demo应用，若您需切换到您自己的 App，请重新导入您的 [meta.config 文件](https://tech.antfin.com/docs/2/87321#h2-u4E0Bu8F7Du914Du7F6Eu6587u4EF63)。

![image.png](https://intranetproxy.alipay.com/skylark/lark/0/2020/png/271/1584704865503-27a68a4e-d656-41bf-b4c8-784a71d68994.png#align=left&display=inline&height=300&name=image.png&originHeight=1200&originWidth=1800&size=517902&status=done&style=none&width=450)
##
