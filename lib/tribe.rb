class Tribe
  attr_reader :name, :members

  def initialize(args = {})
    @name = args[:name]
    @members = args[:members]

    puts to_s
  end

  def to_s
    name
  end

  def tribal_council(immune = {})
	   members.reject{ |member| member == immune }.sample
	end

  def delete(member)
    members.delete(member)
  end

end
