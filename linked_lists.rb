class LinkedList
    attr_reader :listname
    def initialize(listname, head = nil)
        @listname = listname
        @head = Node.new(head)
    end
    def append(name)
        if @head.name.nil? || @head.pointer.nil?
            @head.name = name
        else
            node = @head
            until node.pointer.nil?
                node = node.pointer
            end
            node.pointer = Node.new(name)
        end
    end
    def prepend(name)
        pointer_of_new_node = @head.pointer
        @head.pointer = Node.new(name, pointer_of_new_node)
    end
    def size
        size = 1
        node = @head
        until node.pointer.nil?
            node = node.pointer
            size += 1
        end
        size
    end
    def head
        @head
    end
    def tail
        node = @head
        until node.pointer.nil?
            node = node.pointer
        end
        node
    end
    def at(index)
        node_index = 0
        node = @head
        until node_index == index
            node_index += 1
            node = node.pointer
        end
        node
    end
    def pop
        node_parent = @head
        until node_parent.pointer.pointer.nil?
            node_parent = node_parent.pointer
        end
        node_parent.pointer = nil
        self
    end
    def contains?(name)
        node = @head
        until node.pointer.nil?
            if node.name == name
                return true
            else
                node = node.pointer
            end
        end
        false        
    end
    def find(name)
        node_index = 0
        node = @head
        until node.pointer.nil?
            if node.name == name
                return node_index
            else
                node_index += 1
                node = node.pointer
            end
        end
        nil
    end
    def to_s
        string = ''
        node = @head
        until node.nil?
            string += "(#{node.name}) -> "
            node = node.pointer
        end
        string + "nil"
    end
    def insert_at(value, index)
        node = @head
        index.times do
            node = node.pointer
        end
        at(index-1).nil? ? @head = Node.new(value, node) : at(index-1).pointer = Node.new(value, node)
        self
    end
    def delete_at(index)
        if at(index).nil?
            return "No such node"
        elsif index == 0
            @head = at(1)
        else
            at(index-1).pointer = at(index+1)
        end
        self
    end
end

class Node

    attr_accessor :name, :pointer

    def initialize(name = nil, pointer = nil)
        @name = name
        @pointer = pointer
    end

end

my_friends = LinkedList.new('my friends')
my_friends.append('Clara')
my_friends.prepend('Adria')
my_friends.prepend('Pablo')
my_friends.append('Rosa')
p my_friends
puts "\nSize of list named '#{my_friends.listname}': #{my_friends.size}"
puts "\nHead:"
p my_friends.head
puts "\nTail:"
p my_friends.tail
puts "\nNode at index 2:"
p my_friends.at(2)
my_friends.pop
puts "\nDoes '#{my_friends.listname}' contain Pablo: #{my_friends.contains?('Pablo')}"
puts "Does '#{my_friends.listname}' contain Rosa: #{my_friends.contains?('Rosa')}"
puts "What index in the list is Pablo at: #{my_friends.find('Pablo')}"
p my_friends.to_s
p my_friends.insert_at('Jose',1).to_s
p my_friends.delete_at(2).to_s