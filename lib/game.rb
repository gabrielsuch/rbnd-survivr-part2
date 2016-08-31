class Game
  attr_reader :tribes

  def initialize(*args)
    @tribes = args
  end

  def add_tribe(tribe)
    tribes << tribe
  end

  def immunity_challenge
    tribes.sample
  end

  def clear_tribes
    @tribes = []
  end

  def merge(name)
		members = tribes.map(&:members).flatten
		merged = Tribe.new({ name: name, members: members })
		clear_tribes
		add_tribe(merged)
		merged
	end

  def individual_immunity_challenge
    tribes.first.members.sample
  end

end
