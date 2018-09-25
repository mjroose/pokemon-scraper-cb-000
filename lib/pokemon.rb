class Pokemon
  @@all = []
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(data)
    @name = data[:name]
    @type = data[:type]
    @db = data[:db]
    @hp = 60
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    pokemon = self.new({ name: name, type: type, db: db });
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", [pokemon.name, pokemon.type])
    resp = db.execute("SELECT id FROM pokemon WHERE name = ?", [pokemon.name])
    binding.pry
  end

  def self.find(id, db)
    data = db.execute("SELECT * FROM pokemon WHERE id = ?;", [id])
    pk_id = data[0][0]
    pk_name = data[0][1]
    pk_type = data[0][2]
    self.new(id: pk_id, name: pk_name, type: pk_type, db: db)
  end
end
