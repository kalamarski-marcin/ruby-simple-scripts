#!/usr/bin/env ruby -w
# coding: utf-8
# frozen_string_literal: true
mul = ->(n, m) { n * m }
sum = ->(n, m) { n + m }
div = ->(n, m) { n / m if m > 0 }
sub = ->(n, m) { n - m }

def calc(n, m)
  yield(n, m) if block_given?
end

puts calc(1, 1)
puts calc(10, 10, &mul)
puts calc(10, 10, &sum)
puts calc(10, 10, &div)
puts calc(10, 10, &sub)
