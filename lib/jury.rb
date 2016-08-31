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
    votes = {}
    finalists.each { |finalist| votes[finalist] = 0 }

    members.each do |member|
      choosed = finalists.sample
      votes[choosed] += 1
      puts "#{member} votes for #{choosed.name}".yellow
    end

    return votes
  end

  def report_votes(votes)
    votes.each { |finalist, vote| puts "#{finalist} gets #{vote} votes" }
  end

  def announce_winner(votes)
    votes.each do |finalist, vote|
        if vote > 3 then
          puts "#{finalist.name} Won the game!".red
          return finalist
        end
    end
  end

end
