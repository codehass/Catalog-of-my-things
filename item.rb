require 'securerandom'
require 'date'

class Item
  attr_accessor :publish_date, :archived, :label, :genre, :author, :source

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    true if @publish_date > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private :can_be_archived?
end
