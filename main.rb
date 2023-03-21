require_relative './app'
require_relative './classes/menu'

class Main
  def initialize
    @app = App.new
  end

  def start_app
    input = 1
    menu
    while input.to_i < 14
        print ': '
        input = gets.chomp
        @app.callmethodinapp(input)
    end
  end
end

main = Main.new
main.start_app