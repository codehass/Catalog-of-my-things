require_relative '../classes/author'

describe Author do
  before :each do
    @author = Author.new 'First name', 'Last name'
    @item = Item.new('2020-01-12')
  end

  it '@author should be an instance of Author class' do
    expect(@author).to be_an_instance_of Author
  end

  it 'author first name to be First name' do
    @first_name == 'First name'
  end

  it 'author last name to be Last name' do
    @last_name == 'Last name'
  end

  it 'should return the item passed into author items array' do
    @author.add_item(@item)
    expect(@author.items.length).to eq(1)
  end
end
