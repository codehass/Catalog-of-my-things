require_relative '../classes/label'
require_relative '../classes/book'
require 'date'

describe Label do
  context 'When testing the Label class' do
    book = Book.new('The Wings of Fire', 'publisher', 'bad', '2019/5/10')
    label = Label.new('Book-label', 'Red')

    it 'Should validate the label title' do
      expect(label.title).to eq 'Book-label'
    end

    it 'Should validate the label title' do
      expect(label.color).to eq 'Yellow'
    end

    it 'should add book item object to label items array' do
      label.add_item(book)
      expect(label.items[0]).to eq book
    end
  end
end