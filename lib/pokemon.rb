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

  def self.save(name, type, db)
    pokemon = self.new({ id: 1, name: name, type: type, db: db });
    db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?);", [pokemon.id, pokemon.name, pokemon.type])
  end

  def self.find(id, db)
    data = db.execute("SELECT * FROM pokemon;", [])
    pk_id = data[0][0]
    pk_name = data[0][1]
    pk_type = data[0][2]
    self.new(pk_id, pk_name, pk_type, db)
  end
end
