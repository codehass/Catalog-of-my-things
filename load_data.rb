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

  def save_books(books)
    directory = './json/books.json'
    data = []
    File.new(directory, 'w') unless File.exist?(directory)
    books.each do |book|
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

  def load_labels
    file = './json/labels.json'
    data = []
    if File.exist?(file) && !File.empty?(file)
      JSON.parse(File.read(file)).each do |element|
        data.push(Label.new(element['id'].to_i, element['title'], element['color']))
      end
    end
    data
  end

  def save_labels(labels)
    data = []
    labels.each do |label|
      data.push({ id: label.id, title: label.title, color: label.color })
    end
    File.write('./json/labels.json', JSON.pretty_generate(data))
  end

  def create_label(string, item, labels)
    puts "Enter #{string}'s label title:"
    title = gets.chomp
    puts "Enter #{string}'s label color:"
    color = gets.chomp
    label = Label.new(labels.length + 1, title, color)
    label.add_item(item)
    labels << label
    save_labels(labels)
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
