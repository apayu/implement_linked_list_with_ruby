require 'minitest/autorun'

class TestLinkedList < Minitest::Test
  def test_is_empty?
    linked_list = LinkedList.new
    assert linked_list.is_empty? == true
  end

  def test_push
    linked_list = LinkedList.new
    node = Node.new(1)
    linked_list.push(node)
    assert linked_list.is_empty? == false
  end

  def test_pust_2
    linked_list = LinkedList.new
    linked_list.push(1)
    linked_list.push(2)
    assert linked_list.head.next.data == 2
  end
end

class LinkedList
  attr_reader :head

  def is_empty?
    @head == nil
  end

  def push(data)
    if is_empty?
      @head = Node.new(data)
    else
      current_node = @head
      while current_node.next != nil do
        current_node = current_node.next
      end
      current_node.next = Node.new(data)
    end
  end
end

class Node
  attr_accessor :next
  attr_reader :data

  def initialize(data, next_node = nil)
    @data = data
    @next = next_node
  end
end
