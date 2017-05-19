#!/bin/bash
mkdir -pv $1/{dev,proc,sys,run}
mkdir -pv $1/{bin,boot,etc/{opt,sysconfig},home,lib/firmware,mnt,opt}
mkdir -pv $1/{media/{floppy,cdrom},sbin,srv,var}
install -dv -m 0750 $1/root
install -dv -m 1777 $1/tmp $1/var/tmp
mkdir -pv $1/usr/{,local/}{bin,include,lib,sbin,src}
mkdir -pv $1/usr/{,local/}share/{color,dict,doc,info,locale,man}
mkdir -v  $1/usr/{,local/}share/{misc,terminfo,zoneinfo}
mkdir -v  $1/usr/libexec
mkdir -pv $1/usr/{,local/}share/man/man{1..8}
mkdir -v $1/var/{log,mail,spool}
ln -svf /run $1/var/run
ln -svf /run/lock $1/var/lock
mkdir -pv $1/var/{opt,cache,lib/{color,misc,locate},local}
touch $1/var/log/{btmp,lastlog,faillog,wtmp}
chmod -v 664  $1/var/log/lastlog
chmod -v 600  $1/var/log/btmp
