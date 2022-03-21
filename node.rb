require 'minitest/autorun'

class TestLinkedList < Minitest::Test
  def test_is_empty?
    linked_list = LinkedList.new
    assert linked_list.is_empty? == true
  end
end

class LinkedList
  def is_empty?
    @head == nil
  end
end

class Node
  attr_reader :data, :next

  def initialize(data, next_node = nil)
    @data = data
    @next = next_node
  end
end
