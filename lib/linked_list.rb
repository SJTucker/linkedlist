require 'linked_list_item.rb'
class LinkedList
  attr_accessor :first_payload
  attr_accessor :current_payload
  attr_accessor :size
  
  def initialize(*args)
    self.size = 0
    @current_payload = nil
    args.each do |arg|
      self.add_item(arg)
    end
   end

  def add_item(payload)
    self.size = @size + 1
    if self.first_payload == nil
      self.first_payload = LinkedListItem.new(payload)
      LinkedListItem.new(payload)
    else
      if self.current_payload == nil
        self.current_payload = LinkedListItem.new(payload)
        self.first_payload.next_list_item = self.current_payload
      else
        self.current_payload.next_list_item = LinkedListItem.new(payload)
        self.current_payload = LinkedListItem.new(payload)
      end
    end



  end

  def get(num)
    if (num < 0)
      raise IndexError
    end


    current = self.first_payload

    (0..num).each do |x|
      if current == nil
        raise IndexError
      end

      if(x == num)
        return current.payload
      else
        current = current.next_list_item
      end
    end
  end

  def last
    if self.current_payload == nil
      nil
    else
      self.current_payload.payload
    end
  end

  def to_s
    string = "| "
    current = self.first_payload
    while current != nil
      string += current.payload.to_s
      current = current.next_list_item
      if (current != nil)
        string += ","
      end
      string += " "
    end
    string += "|"
    return string
  end


end
