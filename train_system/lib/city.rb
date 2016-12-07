class City
  attr_reader(:name, :id)
  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id].to_i
  end

  def self.all
    returned_cities = []
    cities = DB.exec("SELECT * FROM city")
    cities.each do |city|
      name = city['name']
      id = city['id'].to_i
      new_city = City.new({name: name, id: id})
      returned_cities.push(new_city)
    end
    returned_cities
  end

  def save
    DB.exec("INSERT INTO city (name) VALUES ('#{@name}');")
  end

  def ==(other_city)
    booleans = []
      booleans.push(self.name == other_city.name)
    booleans.all?
  end
end
