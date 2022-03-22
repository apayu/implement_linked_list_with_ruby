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

  def size
    linked_list = LinkedList.new
    linked_list.push(1)
    assert linked_list.size == 1
    linked_list.push(2)
    assert linked_list.size == 2
  end

  def test_pop
    linked_list = LinkedList.new
    linked_list.push(1)
    linked_list.push(2)
    last_node = linked_list.pop
    assert last_node.data == 2
    assert linked_list.size == 1
    last_node = linked_list.pop
    assert last_node.data == 1
    assert linked_list.size == 0
  end

  def test_shift
    linked_list = LinkedList.new
    linked_list.unshift(1)
    linked_list.unshift(2)
    first_node = linked_list.shift
    assert first_node.data == 2
    assert linked_list.size == 1
    # last_node = linked_list.pop
    # assert last_node.data == 1
    # assert linked_list.size == 0
  end
end

class LinkedList
  attr_reader :head

  def is_empty?
    @head == nil
  end

  def size
    if is_empty?
      0
    else
      current_node = @head
      size = 1
      while current_node.next != nil do
        size += 1
        current_node = current_node.next
      end
      size
    end
  end

  # insert node and from end
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

  # insert node and from head
  def unshift(data)
    if is_empty?
      @head = Node.new(data)
    else
      new_head = Node.new(data)
      new_head.next = @head
      @head = new_head
    end
  end

  # remove the last node and return it
  def pop
    if is_empty?
      nil
    else
      last_node = @head
      current_node = @head
      if @head.next == nil
        @head = nil
        return last_node
      end

      while current_node.next != nil do
        last_node = current_node
        current_node = current_node.next
      end
      last_node.next = nil
      current_node
    end
  end

  # remove the first node and return it
  def shift
    if is_empty?
      nil
    else
      current_node = @head
      @head = current_node.next
      current_node
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
