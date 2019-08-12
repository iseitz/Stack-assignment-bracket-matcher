# frozen_string_literal: true

class StackUnderflow < StandardError
end
class StackOverflow < StandardError
end

class Stack
  def initialize
    @contents = []
    @index = 0
    @size = 0
  end

  def push(item)
    raise StackOverflow if @size == 20

    @index += 1
    @size += 1
    @contents[@index] = item
  end

  def peek
    @contents[@index]
  end

  def pop
    raise StackUnderflow if empty?

    result = peek
    @index -= 1
    @size -= 1
    result
  end

  def empty?
    @index == 0
  end
end
