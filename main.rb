require_relative './app'
require_relative './modules/menu'

class Main
  def initialize
    @app = App.new
  end

  def start_app
    input = 1
    menu
    while input.to_i < 14
   
    end
  end
end

main = Main.new
main.start_app