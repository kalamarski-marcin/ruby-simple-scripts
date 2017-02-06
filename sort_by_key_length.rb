#!/usr/bin/env ruby -w
# coding: utf-8
# frozen_string_literal: false

# Write a function that sorts the keys in a hash by the length
# of the key as a string. For instance, the hash:

h = { abc: 'hello', 'another_key' => 123, 4567 => 'third' }

# should result in:
# ["abc", "4567", "another_key"]

result1 = h.keys.map(&:to_s).sort { |a, b| a.length <=> b.length }
result2 = h.keys.map(&:to_s).sort_by(&:length)
result3 = h.keys.collect(&:to_s).sort_by { |key| key.length }

p result1
p result2
p result3

def test(a, b)
  p a+b
end

-> (a) {puts a}["Hello world"]