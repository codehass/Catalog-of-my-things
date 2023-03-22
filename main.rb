class Main
  def menu
    @list = {
      '1' => "List all books",
      '2' => "List all labels",
      '3' => "List all music album ",
      '4' => "List all genres",
      '5' => "List of games",
      '6' => "List all authors",
      '7' => "Add book",
      '8' => "Add music album ",
      '9' => "Add a game",
      '10' => "Exit",
    }
  
    @list.each do |index, string|
      puts "#{index} - #{string}"
    end

    gets.chomp.to_i
  end
end