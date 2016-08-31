class Jury
  attr_accessor :members

  def initialize
    @members = []
    @finalists = {}
  end

  def add_member(member)
    @members << member
  end

  def cast_votes(finalists)
    members.each do |member|
      puts 0
    end

    finalists.each_with_index do |finalist, index|
		    @finalists[finalist] = 3.5
		end

    return @finalists
  end

end
