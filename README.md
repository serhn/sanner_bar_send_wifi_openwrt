## Bar code USB scanner for openwrt, send data scan code to server

Designed for a router GL.iNet6416


#### required packages

```sh
opkg install kmod-usb-hid triggerhappy wget
```

#### installation steps

```sh
cp conf.def.sh conf.sh

./read.sh
```


