class Game
  attr_reader :tribes

  def initialize(*args)
    @tribes = args
  end

  def add_tribe(tribe)
    tribes << tribe
    return tribes
  end

  def immunity_challenge
    return tribes.sample
  end

  def clear_tribes
    @tribes = []
    return tribes
  end

end
