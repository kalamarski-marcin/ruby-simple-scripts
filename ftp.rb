# frozen_string_literal: false
require 'net/ftp'

file = 'yourfile'
ftp = Net::FTP.new('host', 'user', 'password')
ftp.chdir('/dir')

filesize = File.size(file)
transfered = 0

ftp.putbinaryfile(file, 'remotefile', 1024) do |chunk|
  transfered += chunk.size
  percent_finished = (transfered.to_f / filesize.to_f) * 100
  print "#{percent_finished.round}% complete"
  print "\r"
end

p ftp.sendcmd('STAT')
