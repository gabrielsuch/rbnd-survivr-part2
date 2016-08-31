class Game
  attr_reader :tribes

  def initialize(*args)
    @tribes = args
  end

  def add_tribe(tribe)
    tribes << tribe
    return tribes
  end

end
