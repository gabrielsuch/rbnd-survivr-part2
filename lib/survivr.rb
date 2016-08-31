require "colorizr"
require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

#After your tests pass, uncomment this code below
#=========================================================
# # Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!
#
# # Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))
#
# # Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases

# 1 contestant at a time is voted off at random (selected from either tribe).
# 8 total contestants are randomly voted off in this phase.
# Tribes are merged into 1 tribe after the 8 eliminations.
def phase_one
  puts "Phase 1 has been started"

  8.times do
    selected_tribe = @borneo.immunity_challenge
		puts "#{selected_tribe} was the tribe selected to vote".yellow
		voted_off = selected_tribe.tribal_council
		puts "#{voted_off} was voted OUT!".red
  end
end

# 3 immunity challenges, with 1 contestant granted immunity in each challenge.
# The tribal council method with an immune contestant is called 3 times, eliminating 1 contestant every time.
# 3 contestants total are eliminated in this phase
def phase_two
  puts "Phase 2 has been started"

  3.times do
    immune = @borneo.individual_immunity_challenge
    puts "#{immune} win the immunity".blue
    voted_off_contestant = @merge_tribe.tribal_council({immune: immune})
    puts "#{voted_off_contestant} is OUT!".red
  end
end

# The tribal council method with an immune contestant is called 7 times, eliminating 1 contestant every time.
# Each contestant voted off becomes a member of the jury.
def phase_three
  puts "Phase 3 has been started"

  7.times do
    immune = @borneo.individual_immunity_challenge
    puts "#{immune} wins the immunity".blue
		voted_off_contestant = @merge_tribe.tribal_council(immune: immune)
		@jury.add_member voted_off_contestant
		puts "#{voted_off_contestant}! is OUT!".red
  end
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner
