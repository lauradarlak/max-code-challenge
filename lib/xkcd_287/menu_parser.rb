class MenuParser

  def start
    puts "Please enter the filename of the menu (.txt)"
    input = gets.chomp
    menu_file = "../menus/#{input}"
    file = IO.read(menu_file, chomp: true)
    puts "#{file}"
  end


end
