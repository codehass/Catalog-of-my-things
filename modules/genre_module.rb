require_relative '../classes/genre'

module GenreModule
  def list_genres
    if @genres.empty?
      puts 'There are no genres!'
    else
      puts 'All the genres:'
      puts '----------------------------'
      @genres.each_with_index do |genre, index|
        puts "[#{index + 1}]: ID: #{genre['id']}, Name: #{genre['name']}"
        puts '----------------------------'
      end
    end
  end

  def add_genres
    print 'Enter the name of the genre: '
    name = gets.chomp
    genre = Genre.new(name)
    @genres << {
      'id' => genre.instance_variable_get('@id'),
      'name' => genre.name
    }
    puts @genres[0]['name']
    genre
  end
end
