require_relative '../classes/music_album'
require_relative '../classes/genre'
require_relative './genre_module'

module MusicAlbumModule
  include GenreModule
  def list_music_album
    if @music_album.empty?
      puts 'There are no music albums!'
    else
      puts 'All the music albums:'
      puts '----------------------------'
      @music_album.each_with_index do |album, index|
        print "[Album #{index + 1}]  Published date : #{album['publish_date']}, Genre : #{album['name']},"
        puts " on spotify : #{album['on_spotify']}"
        if album['on_spotify']
          puts 'Available on spotify.'
        else
          puts 'Not available on spotify.'
        end
        puts '----------------------------'
      end
    end
  end

  def add_music_album
    print 'Please enter the published date [yyyy-mm-dd] : '
    publish_date = gets.chomp.to_s
    print 'Is it on spotify? [y/n] : '
    on_spotify = gets.chomp.to_s.downcase
    on_spotify = %w[y yes].include?(on_spotify)
    album = MusicAlbum.new(publish_date, on_spotify)
    genre = add_genres
    genre.add_item(album)
    album_hash = {
      'on_spotify' => album.instance_variable_get('@on_spotify'),
      'publish_date' => album.instance_variable_get('@publish_date'),
      'name' => genre.name
    }
    @music_album << album_hash
    puts "Album of genre '#{genre.name}' and publish date '#{publish_date}' added successfully!"
  end
end
