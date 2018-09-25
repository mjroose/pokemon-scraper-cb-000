class Pokemon
  @@all = []

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @type = data[:type]
    @db = data[:db]
    binding.pry
    @@all << self
  end

  def self.all
    @@all
  end
end
