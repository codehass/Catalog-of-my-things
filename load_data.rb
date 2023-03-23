class Loader
  def load_albums(music_album)
    if File.exist?('./data/music_album.json')
      JSON.parse(File.read('./data/music_album.json')).each do |album|
        music_album << album
      end
    else
      music_album = []
    end
  end
  
  def load_genres(genres)
    if File.exist?('./data/genres.json')
      JSON.parse(File.read('./data/genres.json')).each do |genre|
        genres << genre
      end
    else
      genres = []
    end
  end
end