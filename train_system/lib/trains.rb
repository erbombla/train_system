class Train
  attr_reader(:name, :time, :city_id, :id)
  def initialize(attributes)
    @name = attributes[:name]
    @time = attributes[:time]
    @city_id = attributes[:city_id]
    @id = attributes[:id].to_i
  end

  def self.all
    returned_trains = []
    trains = DB.exec("SELECT * FROM trains")
    trains.each do |train|
      name = train['name']
      time = train['time']
      city_id = train['city_id'].to_i
      id = train['id'].to_i
      new_train = Train.new({name: name, time: time, city_id: city_id, id: id})
      returned_trains.push(new_train)
    end
    returned_trains
  end

  def save
    DB.exec("INSERT INTO trains (name, time) VALUES ('#{@name}', '#{@time}');")
  end

  def set_city(new_city_id)
    @city_id = new_city_id
    DB.exec("UPDATE trains SET city_id = #{@city_id} WHERE id = #{@id};")
  end

  def ==(other_train)
    booleans = []
      booleans.push(self.name == other_train.name)
      booleans.push(self.time == other_train.time)
      booleans.push(self.city_id == other_train.city_id)
    booleans.all?
  end
end
