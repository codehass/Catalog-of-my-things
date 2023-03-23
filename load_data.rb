class Loader
  def load_albums(music_album)
    if File.exist?('./JSON/music_album.json')
      JSON.parse(File.read('./JSON/music_album.json')).each do |album|
        music_album << album
      end
    else
      music_album = []
    end
  end

  def load_genres(genres)
    if File.exist?('./JSON/genres.json')
      JSON.parse(File.read('./JSON/genres.json')).each do |genre|
        genres << genre
      end
    else
      genres = []
    end
  end

  def load_games(games)
    if File.exist?('./JSON/games.json')
      JSON.parse(File.read('./JSON/games.json')).each do |game|
        games << game
      end
    else
      games = []
    end
  end

  def load_authors(authors)
    if File.exist?('./JSON/authors.json')
      JSON.parse(File.read('./JSON/authors.json')).each do |author|
        authors << author
      end
    else
      authors = []
    end
  end
end
