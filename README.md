# kcptun-daemon
> > > > > > > > Because kcptun does not support daemon option for now, if you want it running at background, you may need to use something like nohup, which seems more like a testing method. Using systemd to manage it is a better way to handle such situation.
> > > > > > > >
> > > > > > > > ## clone repo
> > > > > > > >
> > > > > > > > ```shell
> > > > > > > > git clone https://github.com/colorfulshark/kcptun-daemon.git
> > > > > > > > ```
> > > > > > > >
> > > > > > > > ## install script
> > > > > > > >
> > > > > > > > ```shell
> > > > > > > > cd kcptun-daemon
> > > > > > > > chmod +x install.sh
> > > > > > > > sudo ./install.sh
> > > > > > > > ```

## install kcptun

1. download the latest prebuild program from [KCPtun](https://github.com/shadowsocks/kcptun/releases/latest) according to your platform.
2. uncompress the program, you will get both client and server
3. rename server program to **kcp-server**
4. move server program to `/usr/bin`

## config kcptun

the config file locates at `/etc/kcptun/config.json`, you can find more options from [KCPtun Usage](<https://github.com/shadowsocks/kcptun#usage>).

## take effect

reboot system to take effect

## how to control it

```shell
sudo systemctl enable kcptun.service  # enable auto start
sudo systemctl disable kcptun.service # disable auto start
sudo systemctl start kcptun.service   # start service
sudo systemctl stop kcptun.service    # stop service
sudo systemctl restart kcptun.service # restart service
sudo systemctl status kcptun.service  # get service status
```

