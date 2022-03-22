require 'minitest/autorun'

class TestLinkedList < Minitest::Test
  def test_is_empty?
    linked_list = LinkedList.new
    assert linked_list.is_empty? == true
  end

  def test_push
    linked_list = LinkedList.new
    linked_list.push(1)
    linked_list.push(2)
    assert linked_list.head.next.data == 2
  end

  def test_unshift
    linked_list = LinkedList.new
    linked_list.unshift(1)
    linked_list.unshift(2)
    assert linked_list.head.data == 2
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

  def unshift(data)
    if is_empty?
      @head = Node.new(data)
    else
      new_head = Node.new(data)
      new_head.next = @head
      @head = new_head
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
