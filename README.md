# luci-app-devgate

## 适用环境

适用于 OpenWrt 24.10 / iStoreOS 24.10 等基于 LuCI 和 firewall4 的环境。

当前仓库的 GitHub Actions 默认使用 OpenWrt 24.10.6 x86/64 SDK 编译。

## 用途介绍

设备门禁是一个 LuCI 插件，用于按设备限制上网规则。

当前功能包括：

- 按时间段控制设备上网。
- 按累计可用时长控制设备上网。
- 为不同设备设置不同管控强度。
- 当前生效的阻止规则会同步写入 `/etc/config/firewall` 的通信规则，LuCI 的“防火墙 - 通信规则”页面可见，规则名以 `DevGate -` 开头。

插件安全策略：

- 已从目标设备列表排除当前登录 LuCI 的设备，避免误选屏蔽自己。

## 安装方式

从 GitHub Actions 下载编译生成的 `.ipk` 文件，上传到路由器后安装：

```sh
opkg install /tmp/luci-app-devgate_*.ipk
rm -rf /tmp/luci-indexcache /tmp/luci-modulecache /tmp/luci-*cache
```

安装完成后刷新 LuCI 页面，进入：

```text
服务 -> 设备门禁
```
