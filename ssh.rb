#!/usr/bin/env ruby -w
# coding: utf-8
# frozen_string_literal: false
require 'net/ssh'
Net::SSH.start('host', 'user', port: 22, config: true) do |ssh|
  loop do
    puts 'Type command: '
    command = gets
    output = ssh.exec!(command.to_s)
    puts output
  end
end
