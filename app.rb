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
    if @music_album.empty?
      puts 'There are no music albums!'
    else
      @music_album.each_with_index do |album, index|
        print "[Album #{index + 1}]  Published date : #{album.publish_date}, Genre : #{album.name},"
        puts " on spotify : #{album.on_spotify}"
        if album.on_spotify
          puts 'Available on spotify.'
        else
          puts 'Not available on spotify.'
        end
      end
    end
  end

  # Code to list all genres
  def list_genres
    if @genres.empty?
      puts "There are no genres!"
    else
      puts "All the genres:"
      @genres.each_with_index do |genre, index|
        puts "#{index + 1}. #{genre.name}"
      end
    end
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
