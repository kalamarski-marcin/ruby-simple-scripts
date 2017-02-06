#!/usr/bin/env ruby -w
# coding: utf-8
# frozen_string_literal: false
require 'colorize'

border = '|'
top_bottom = '-'
from = 1
to = 10
cell_size = 5
corner = '+'
count_chars = ((to - from + 1) * cell_size) + to - from
grid_color = :light_blue

exp_position = from

(from..to).each do |x|
  line = top_bottom * count_chars
  border_top_bottom = (corner.clone << line << corner).send(grid_color)
  border_inner = (border.clone << line << border).send(grid_color)
  border_left_right = border.clone.send(grid_color)
  puts border_top_bottom if x.eql?(from)
  (from..to).each do |y|
    print border_left_right if y.eql?(from)
    result = (x * y).to_s
    cell_filling = result.center(cell_size)
    print cell_filling.colorize(background: grid_color) if y.eql?(exp_position)
    print cell_filling unless y.eql?(exp_position)
    print border_left_right
  end
  exp_position += 1
  puts
  puts border_inner unless x.eql?(to)
  puts border_top_bottom if x.eql?(to)
end
