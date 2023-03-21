require_relatives 'options'


class App

  def initialize
    @options = {
      'List options here',
   
    }
  end

  def handle_options(input)
    if input.to_i.between?(1, 13)
      @options[input].call
    else
      puts 'Invalid Input!'
    end
  end

  def quit_app
    puts 'See you again!'
    exit(true)
  end
end
