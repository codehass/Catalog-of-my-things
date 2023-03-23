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

  def save_books
    directory = './json/books.json'
    data = []
    File.new(directory, 'w') unless File.exist?(directory)
    @books.each do |book|
      data.push({ name: book.name, publisher: book.publisher, cover_state: book.cover_state,
                  publish_date: book.publish_date })
    end
    File.open(directory, 'w') do |file|
      file.puts(JSON.pretty_generate(data))
    end
  end

  def load_books
    data = []
    file = './json/books.json'
    if File.exist?(file) && !File.empty?(file)
      JSON.parse(File.read(file)).each do |element|
        data << Book.new(element['name'], element['publisher'], element['cover_state'], element['publish_date'])
      end
    end
    data
  end
    
end
