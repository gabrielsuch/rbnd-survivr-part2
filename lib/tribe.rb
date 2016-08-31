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
	   eliminated = members.reject{ |member| member == immune[:immune] }.sample
     delete(eliminated)
     eliminated
	end

  def delete(member)
    members.delete(member)
  end

end
