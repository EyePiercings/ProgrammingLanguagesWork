#!/usr/bin/env ruby
# coding: utf-8

# Original ©2009 Jim Ingram
# Modifications ©2018 Daniel Barowy

class BrEph
  def initialize
    @ops = create_ops
    @tape = Array.new(1024,0)
    @tp = 0
    @code = []
    @cp = 0
  end

  def compile c
    c.split("").each do |o|
      if @ops.has_key? o
        @code << o
      end
    end
    return self
  end

  def run
    while @cp < @code.size
      run_op @code[@cp]
    end
    @cp = 0
  end

  private

  def run_op op
    @ops[op].call
    @cp += 1
  end

  def get_input
    @tape[@tp] = STDIN.getc
    # getc returns nil on EOF. We want to use 0 instead.
    @tape[@tp] = 0 unless @tape[@tp]
  end

  def create_ops
    { "e" => Proc.new { @tp = (@tp == @tape.size - 1 ? 0 : @tp + 1) },
      "p" => Proc.new { @tp = (@tp == 0 ? @tape.size - 1 : @tp - 1) },
      "h" => Proc.new { @tape[@tp] += 1 },
      "r" => Proc.new { @tape[@tp] -= 1 },
      "!" => Proc.new { print @tape[@tp].chr if @tape[@tp] },
      "a" => Proc.new { get_input },
      "i" => Proc.new { jump_to_close if @tape[@tp] == 0 },
      "m" => Proc.new { jump_to_open unless @tape[@tp] == 0 }
    }
  end

  def jump_to_close
    level = 1
    while @cp < @code.size
      @cp += 1
      if @code[@cp] == 'i'
        level += 1
      elsif @code[@cp] == 'm'
        level -= 1
      end
      break if level == 0
    end
  end

  def jump_to_open
    level = 1
    while @cp >= 0
      @cp -= 1
      if @code[@cp] == 'm'
        level += 1
      elsif @code[@cp] == 'i'
        level -= 1
      end
      break if level == 0
    end
  end
end

if __FILE__ == $0
  app =  BrEph.new
  File.open(ARGV[0], 'r') { |f|
    app.compile(f.read)
  }
  app.run
  puts "\n"
end
