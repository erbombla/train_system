require 'spec_helper.rb'

describe 'Train' do
  describe '.all' do
    it 'will return an empty array to start' do
      new_train = Train.new({name: 'Thomas', time: '1945-12-06 00:00:00', city_id: nil, id: nil})
      expect(Train.all).to eq([])
    end
  end

  describe '#save' do
    it 'will save a new train to the database' do
      new_train = Train.new({name: 'Thomas', time: '1945-12-06 00:00:00', city_id: 0, id: nil})
      new_train.save
      expect(Train.all).to eq([new_train])
    end
  end

  describe '#set_city' do
    it 'will set a city for a train' do
      new_train = Train.new({name: 'Thomas', time: '1945-12-06 00:00:00', city_id: nil, id: 1})
      new_train.save
      new_train.set_city(1)
      expect(new_train.city_id).to eq(1)
    end
  end

  describe "==" do
    it "is the same task if it has the same attributes" do
      task1 = Train.new({name: 'Thomas', time: '1945-12-06 00:00:00', city_id: nil})
      task2 = Train.new({name: 'Thomas', time: '1945-12-06 00:00:00', city_id: nil})
      expect(task1).to(eq(task2))
    end
  end
end
