require_relative './classes/music_album'
require_relative './classes/genre'
require_relative './classes/book'

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
    if @books.empty?
      puts 'There are no books in the library'
      return
    end
    @books.each_with_index do |book, index|
      print "#{index + 1}-Name: #{book.name} , Publisher: #{book.publisher}, Cover state: #{book.cover_state} , Publish date: #{book.publish_date}\n\n"
    end
  end

  # Code to list all labels7
  def list_labels
    if @labels.empty?
      puts 'no labels yet!'
    else
    @labels.each do |label|
      print "ID: #{label.id} , Title: #{label.title} , Color: #{label.color}"
    end
  end

  # Code to list all music album
  def list_music_album
    if @music_album.empty?
      puts 'There are no music albums!'
    else
      @music_album.each_with_index do |album, index|
        print "[Album #{index + 1}]  Published date : #{album.publish_date}, Genre : #{album.genre.name},"
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
      puts 'There are no genres!'
    else
      puts 'All the genres:'
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
    puts 'Book added successfully!'
  end

  # Code to add music album
  def add_music_album
    print 'Please enter the published date [yyyy-mm-dd] : '
    publish_date = gets.chomp.to_s
    print 'Is it on spotify? [y/n] : '
    on_spotify = gets.chomp.to_s.downcase

    on_spotify = %w[y yes].include?(on_spotify)

    album = MusicAlbum.new(publish_date, on_spotify)
    @music_album << album
    genre = add_genres
    genre.add_item(album)

    puts "Album of genre '#{genre.name}' and publish date '#{publish_date}' added successfully!"
  end

  # Code to add game
  def add_genres
    print 'Enter the name of the genre: '
    name = gets.chomp
    genre = Genre.new(name)
    @genres << genre
    genre
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
