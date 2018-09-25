class Pokemon
  @@all = []

  def initialize(id, name = nil, type = nil, db = nil)
    @id = :id
    @name = :name
    @type = :type
    @db = :db
    binding.pry
    @@all << self
  end

  def self.all
    @@all
  end
end
