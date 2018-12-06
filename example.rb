#!/usr/bin/env ruby
# coding: utf-8

require "wxl_process_bar"

文件=File.new("/tmp/1.log","w")
循环次数=10
显示宽度=50 #默认是屏幕宽度
进度条=C_进度条.new 循环次数,显示宽度
进度条2=C_进度条.new 循环次数,显示宽度
循环次数.times {
        进度条.更新
        文件.write 进度条2.更新记录到日志
       	文件.fsync
        sleep 0.1
}