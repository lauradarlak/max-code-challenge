class MenuParser

  attr_reader :target_total
  attr_reader :menu_item
  attr_reader :menu_prices

  def initialize(file_data)
    @target_total = convert_currency(file_data[0])
    @menu_item = []
    @menu_prices = []
    parse_menu(file_data[1..-1])
  end

  def convert_currency(string)
    price = string.gsub(/\D/, '').to_i
    return price
  end

  def parse_menu(menu)
    menu.each do |item|
      item.slice!("$")
      item = item.split(",")
      @menu_item << item[0]
      @menu_prices << convert_currency(item[1])
    end
  end


end
