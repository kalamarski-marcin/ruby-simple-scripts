#!/usr/bin/env ruby -w
# coding: utf-8
# frozen_string_literal: true
class Foo
  def hmmm; end

  def is_that_work?
    'Directly from class definition'
  end

  def self.singleton_method_removed(id)
    puts 'removed: ' << id.to_s
  end

  def self.singleton_method_added(id)
    puts 'Adding singleton method ' << id.to_s
  end
end

obj = Foo.new
obj2 = Foo.new

def obj.is_that_work?
  puts 'Only in this object'
end

class << obj
  undef_method :is_that_work?
end

print 'Invoke method in class: '
puts Foo.instance_method(:is_that_work?).bind(obj).call

if obj.respond_to?(:is_that_work?)
  put obj.is_that_work?
else
  puts 'There is no method works'
end

class << obj
  def foo1 # it works
    puts 'OK1'
  end
end

# Despite, it only has been added within instance of Foo class
# it is still possible to add class method directly.

class << obj
  def Foo.foo2
    puts 'OK2'
  end
end

puts obj.inspect

class << obj
  # singleton_method_added has been invoked and it is OK.
  # but method is added to eigenclass
  def self.foo3
    puts 'OK3'
  end

  def eigenclass
    class << self
      self
    end
  end
end

class << obj
  foo3
end

obj.eigenclass.foo3

begin
  obj.foo1
  obj.class.foo2
  obj2.class.foo2
rescue StandarError => e
  puts e.message
ensure
  obj.eigenclass.foo3
end

#
class Person
  def name
    'marcin'
  end
  puts inspect
end

marcin = Person.new
puts marcin.name

marcin.instance_eval do
  def name
    'ha'
  end
end

h = Person.new
puts h.name
