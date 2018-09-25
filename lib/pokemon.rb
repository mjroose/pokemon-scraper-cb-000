class Pokemon
  @@all = []
  attr_accessor :id, :name, :type, :db

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @type = data[:type]
    @db = data[:db]
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?);", [self.id, self.name, self.type])
  end
end
