require_relative '../classes/genre'
require_relative '../item'

describe Genre do
  before :each do
    @genre = Genre.new('Genre name')
    @item = Item.new('2020-01-01', archived: true)
  end

  it 'Create instance of Genre class' do
    expect(@genre).to be_instance_of(Genre)
  end

  it 'Validate the genre name' do
    expect(@genre.name).to eq('Genre name')
  end

  it 'Add item using method add_item' do
    expect(@genre.add_item(@item)).to eq(@genre.items)
  end
end
