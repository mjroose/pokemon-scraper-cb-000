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
end
