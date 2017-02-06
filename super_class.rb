#!/usr/bin/env ruby -w
# coding: utf-8
# frozen_string_literal: true
# Find last ancestor which have method definition

def superclass(object, method)
  klass = object.class
  methods = klass.instance_methods
  last_klass_which_has_method = klass if methods.include?(method)
  klass = klass.superclass
  methods = klass.instance_methods

  loop do
    last_klass_which_has_method = klass if methods.include?(method)
    klass = klass.superclass
    break if klass.nil?
    methods = klass.instance_methods.sort!
  end
  last_klass_which_has_method
end

def monk(_arg1, _arg2)
  'Monks'
end

m = method(:monk)
puts m
