require_relative '../classes/music_album'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new('2000-02-02',false)
  end

  it 'creates an instance of MusicAlbum class' do
    expect(@music_album).to be_instance_of(MusicAlbum)
  end

  it 'inherits from the Item class' do
    expect(@music_album).to be_kind_of(Item)
  end

  it 'sets the publish_date' do
    expect(@music_album.publish_date).to eq('2000-02-02')
  end

  it 'sets the archived attribute' do
    expect(@music_album.archived).to be false
  end

  it 'sets the on_spotify attribute' do
    expect(@music_album.instance_variable_get(:@on_spotify)).to be false
  end

  it 'returns true when can_be_archived? is called and publish_date is greater than 10 years' do
    expect(@music_album.can_be_archived?).to be false
  end

end
