## Bar code USB scanner for openwrt, send data scan code to server

Designed for a router GL.iNet6416


#### required packages

`
opkg install kmod-usb-hid triggerhappy wget
`

#### installation steps
`
cp conf.def.sh conf.sh

./read.sh
`


