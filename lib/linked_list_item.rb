class LinkedListItem
  attr_accessor :payload
  attr_accessor :next_list_item

  def initialize(payload)
    @payload = payload
  end

  def next_list_item= val
    raise ArgumentError if val == self
    @next_list_item= val
  end

  def last?
    @next_list_item == nil ? true : false
  end

  include Comparable
  def ===(another)
    self.object_id === another.object_id ? true : false
  end

  def <=> (other)
    self.payload.to_s <=> other.payload.to_s
  end
end
