# frozen_string_literal: true

require_relative 'stack'

class BracketMatcher
  def initialize(str)
    @str = str
    @pairs = { '{' => '}', '[' => ']', '(' => ')' }
  end

  def valid?
    @opening_brackets = []
    @stack = Stack.new
    @str.split('').each do |char|
      if @stack.empty?
        @stack.push(char)
      elsif @pairs[char]
        @stack.push(char)
      elsif @pairs[char].nil? && @pairs[@stack.peek] == char
        return false unless @stack.pop == @pairs.key(char)
      end
    end
    @stack.empty?
  end
end
