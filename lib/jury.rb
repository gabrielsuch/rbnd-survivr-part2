class Jury
  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member(member)
    @members << member
  end

  def cast_votes(finalists)
    members.each do |member|
      puts 0
    end
    
    Hash[ finalists.collect { |finalist| [finalist, 0] } ]
  end

end
