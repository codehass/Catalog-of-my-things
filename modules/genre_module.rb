require_relative '../classes/genre'

module GenreModule
  def list_genres
    if @genres.empty?
      puts 'There are no genres!'
    else
      puts 'All the genres:'
      @genres.each_with_index do |genre, index|
        puts "#{index + 1}. #{genre['name']}"
      end
    end
  end

  def add_genres
    print 'Enter the name of the genre: '
    name = gets.chomp
    genre = Genre.new(name)
    @genres << { 'name' => genre.name }
    puts @genres[0]['name']
    genre
  end
end
