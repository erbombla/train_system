require 'spec_helper.rb'

describe 'City' do
  describe '.all' do
    it 'will return an empty array to start' do
      new_city = City.new({name: 'Portland', id: nil})
      expect(City.all).to eq([])
    end
  end

  describe '#save' do
    it 'will save a new city to the database' do
      new_city = City.new({name: 'Portland', id: nil})
      new_city.save
      expect(City.all).to eq([new_city])
    end
  end

  describe "==" do
    it "is the same task if it has the same attributes" do
      task1 = City.new({name: 'Portland'})
      task2 = City.new({name: 'Portland'})
      expect(task1).to(eq(task2))
    end
  end
end
