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

# handel the choices
def choice(user_answer, response)
  actions = {
    1 => :list_books,
    2 => :list_labels,
    3 => :list_music_album,
    4 => :list_genres,
    5 => :list_games,
    6 => :list_authors,
    7 => :add_book,
    8 => :add_music_album,
    9 => :add_game,
    10 => :exit_app
  }

  action = actions[user_answer]
  response.send(action)
end