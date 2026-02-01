class BoutiqueInventory
  def initialize(items)
    @items = items
  end

  def item_names
    @items.map {|item| item[:name]}.sort
  end

  def cheap
    @items.select {|item| item[:price] < 30}
  end

  def out_of_stock
    @items.select {|item| item[:quantity_by_size] == {}}
  end

  def stock_for_item(name)
    item =  @items.find {|item| item[:name] == name}
    raise ArgumentError "no item with name '#{name}'" unless item
    
    item[:quantity_by_size]
  end

  def total_stock
    @items.sum {|item| item[:quantity_by_size].sum{|_, stock| stock}}
  end

  private
  attr_reader :items
end
