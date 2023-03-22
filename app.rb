class App
  puts
  puts "Welcome to Catalog of my things app!\n\n"
  def initialize
    @books = []
    @labels = []
    @music_album = []
    @genres = []
    @games = []
    @authors = []
  end

  # Code to list all books
  def list_books
    puts 'books'
    puts
  end

  # Code to list all labels
  def list_labels
    puts 'labels'
    puts
  end

  # Code to list all music album
  def list_music_album
    puts 'music album'
    puts
  end

  # Code to list all genres
  def list_genres
    puts 'genres'
    puts
  end

  # Code to list all games
  def list_games
    puts 'games'
    puts
  end

  # Code to list all authors
  def list_authors
    puts 'authors'
    puts
  end

  # Code to add book
  def add_book
    puts 'add book'
    puts
  end

  # Code to add music album
  def add_music_album
    puts 'add album'
    puts
  end

  # Code to add game
  def add_game
    puts 'add game'
    puts
  end

  # exit function
  def exit_app
    puts 'Thank you for using this app!'
    exit
  end
end
