require_relative './load_data'
require 'json'
require_relative './classes/book'
require_relative './classes/label'
require_relative './classes/game'
require_relative './classes/author'
require_relative './modules/music_album_module'

class App
  include MusicAlbumModule
  puts
  puts "Welcome to Catalog of my things app!\n\n"
  def initialize
    @books = []
    @labels = []
    @music_album = []
    @genres = []
    @games = []
    @authors = []

    loader = Loader.new
    loader.load_albums(@music_album)
    loader.load_genres(@genres)
    @books = loader.load_books
    @labels = loader.load_labels
    loader.load_games(@games)
    loader.load_authors(@authors)
  end

  # Code to list all books
  def list_books
    if @books.empty?
      puts 'There are no books in the library'
      return
    end
    @books.each_with_index do |book, index|
      print "#{index + 1}-Name: #{book.name} , Publisher: #{book.publisher},
       Cover state: #{book.cover_state} , Publish date: #{book.publish_date}\n\n"
    end
  end

  # Code to list all labels7
  def list_labels
    if @labels.empty?
      puts 'no labels yet!'
    else
      puts "------------------------------------------------------------------------\n"
      @labels.each do |label|
        print "ID: #{label.id} , Title: #{label.title} , Color: #{label.color}\n"
      end
      puts "------------------------------------------------------------------------\n\n"
    end
  end

  def list_games
    if @games.empty?
      puts 'There is no game added!'
    else
      puts 'All the games: '
      puts '----------------------------'
      @games.each_with_index do |game, index|
        print "[Game #{index + 1}]. Multiplayer : #{game['multiplayer']}, Publish Date :"
        puts " #{game['publish_date']}, Last Played Date : #{game['last_played_date']}"
        puts '----------------------------'
      end
    end
  end

  def list_authors
    puts 'All authors: '
    puts '----------------------------'
    if @authors.empty?
      puts 'There are no authors!'
    else
      puts 'Authors:'
      @authors.each_with_index do |author, index|
        puts "[Author #{index + 1}]. First Name : #{author['first_name']}, Last Name : #{author['last_name']} "
        puts '----------------------------'
      end
    end
  end

  def add_book
    puts 'Please enter the name of the book:'
    name = gets.chomp
    puts 'Please nter the publisher:'
    publisher = gets.chomp
    puts 'Please enter state of the book: good or bad'
    cover_state = gets.chomp
    if cover_state != 'good' && cover_state != 'bad'
      puts 'Invalid state'
      return
    end
    puts 'Please enter the publish date of the book: YYYY-MM-DD'
    date = gets.chomp
    puts date
    book = Book.new(name, publisher, cover_state, date)
    @books << book
    loader = Loader.new
    loader.create_label('book', book, @labels)
    loader.save_books(@books)
    puts 'Book added successfully!'
  end

  def add_game
    puts 'Is it a multiplayer game? [Y/N]: '
    multiplayer = gets.chomp.to_s.downcase
    multiplayer = %w[y yes].include?(multiplayer)
    puts 'What is the publish date for the game [yyyy-mm-dd]: '
    publish_date = gets.chomp
    puts 'What is the last played date [yyyy-mm-dd]: '
    last_played_date = gets.chomp
    game = Game.new(publish_date, multiplayer, last_played_date)
    game_hash = {
      'publish_date' => publish_date,
      'multiplayer' => multiplayer,
      'last_played_date' => last_played_date
    }
    @games << game_hash
    author = add_author
    author.add_item(game)
    puts "The game created with #{author.first_name} author added successfully!"
  end

  def add_author
    print 'Enter the first name of the author: '
    first_name = gets.chomp
    print 'Enter the last name of the author: '
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    author_hash = {
      'first_name' => first_name,
      'last_name' => last_name
    }
    @authors << author_hash
    author
  end

  def exit_app
    File.write('./JSON/music_album.json', JSON.pretty_generate(@music_album))
    File.write('./JSON/genres.json', JSON.pretty_generate(@genres))
    File.write('./JSON/games.json', JSON.pretty_generate(@games))
    File.write('./JSON/authors.json', JSON.pretty_generate(@authors))
    puts 'Thank you for using this app!'
    exit
  end
end
