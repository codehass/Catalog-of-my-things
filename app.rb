require_relative './classes/music_album'
require_relative './classes/genre'
require_relative './load_data'

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

    loader = Loader.new
    loader.load_albums(@music_album)
    loader.load_genres(@genres)
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
    puts 'add book'
    puts
  end

  # Code to add music album
  def add_music_album
    print 'Please enter the published date [yyyy-mm-dd] : '
    publish_date = gets.chomp.to_s
    print 'Is it on spotify? [y/n] : '
    on_spotify = gets.chomp.to_s.downcase

    on_spotify = %w[y yes].include?(on_spotify)

    album = MusicAlbum.new(publish_date, on_spotify)
    # @music_album << album
    genre = add_genres
    genre.add_item(album)

    albumHash = {
      'on_spotify' => album.instance_variable_get('@on_spotify'),
      'publish_date'=> album.instance_variable_get('@publish_date'),
      'name'=> genre.name
    }

    @music_album << albumHash
    puts "Album of genre '#{genre.name}' and publish date '#{publish_date}' added successfully!"
  end

  # Code to add game
  def add_genres
    print 'Enter the name of the genre: '
    name = gets.chomp
    genre = Genre.new(name)
    # @genres << genre
    @genres << {'name' => genre.name}
    puts @genres[0]['name']
    genre
  end

  # Code to add game
  def add_game
    puts 'add game'
    puts
  end

  # exit function
  def exit_app
    File.write('./JSON/music_album.json', JSON.generate(@music_album))
    File.write('./JSON/genres.json', JSON.generate(@genres))
    puts 'Thank you for using this app!'
    exit
  end
end
