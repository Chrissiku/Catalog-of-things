require_relative('../classes/genre/genre.rb')
require_relative('../classes/item.rb')

describe Genre do
  before :each do
    @genre = Genre.new('name')
  end

  describe '#new' do
    it 'takes 1 parameters and returns a genre object' do
      expect(@genre).to be_instance_of Genre
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      @genre.name.should eql 'name'
    end
  end

  describe '#Add_Item()' do
    it 'checks if the item is added' do
      @genre.items.should eql []
    end
  end
end
