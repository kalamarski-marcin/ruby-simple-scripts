#!/usr/bin/env ruby -w
# coding: utf-8
# frozen_string_literal: false
loop do
  ['|', '/', '-', '\\', '|', '/', '-', '\\'].each do |x|
    print x << "\b"
    Kernel.sleep(0.1)
  end
end
