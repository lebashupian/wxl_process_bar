#!/usr/bin/env ruby
# coding: utf-8

require "io/console"
获取窗口高_按字符=STDOUT.winsize[0]
获取窗口宽_按行数=STDOUT.winsize[1]




class C_进度条
	#
	# 最后的减2，是因为京都条的收尾，各有一个|,计算的宽度的时候，必须去掉
	# 默认宽度，就是屏幕宽度
	def initialize(循环次数,宽度=STDOUT.winsize[1]-2-循环次数.size-20)
		@当前循环次数=1
		@循环次数=循环次数
		@显示宽度=宽度
		@开始时间=Time.new
		@当前时间=nil
	end

	def 更新
		@当前时间=Time.new



		当前比例=((@当前循环次数.to_f/@循环次数)*@显示宽度).to_i
		剩余比例=@显示宽度-当前比例
		print "|";
		当前比例.times { print "#"};
		剩余比例.times {print " "};
		print "|";
		print " #{@当前循环次数}/#{@循环次数} times:#{(@当前时间-@开始时间).floor(2)}s"
		if 剩余比例 == 0
		print "\n"
		else
		print "\r" 	#光标到行首
		$stdout.flush
		end
		@当前循环次数 += 1
	end

	def 更新记录到日志
		当前比例=((@当前循环次数.to_f/@循环次数)*50).to_i
		剩余比例=50-当前比例
		行=''
		行 << "|";
		当前比例.times { 行 << "#"};
		剩余比例.times { 行 << " "};
		行 << "|";
		行 << "\n"
		@当前循环次数 += 1
		return 行
	end
end


循环次数=10
显示宽度=50
进度条=C_进度条.new 循环次数,显示宽度
循环次数.times {
    进度条.更新
    sleep 0.5
}
