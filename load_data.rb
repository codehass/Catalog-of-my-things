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
end