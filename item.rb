require 'securerandom'
require 'date'

class Item 
    attr_accessor :publish_date, :archived, :label, :genre, :author, :source

    def initialize(publish_date, archived: false)
  
    end
  
    def can_be_archived?
    
    end
  
    def move_to_archive
    end
  
    private :can_be_archived?
end