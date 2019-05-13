class CLI

  def menu_input
    puts "Please enter the filename of the menu (.txt)"
    input = gets.chomp
    menu_file = "./menus/#{input}"
    file = IO.readlines(menu_file).map(&:chomp)
    menu = MenuParser.new(file)
    CombinationFinder.new.menu_combinations(menu)
  end

end
