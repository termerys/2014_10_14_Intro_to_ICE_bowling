
class Game
	def initialize()
		@scores = Array.new(10){Array.new(3)}
		@bonus = Array.new(10)
		@scores.each do |init|
			init[0] = 0
			init[1] = 0
			init[2] = 0
		end
		@bonus.each do |init|
			init = 0
		end
		#In Bonus Array, 0-norm, 1-spare, 2-strike
		@frames = 0
		@rolls = 0
		@lBonus = false

	end

	def roll(pins) #"pins" is int
		while(true)
			if (pins > 10)
				puts "You must be god to knock down more than 10 pins when there're only 10."
				break
			elsif (@frames > 9)
				puts "The game is already ended."
				break
			end
			if (@frames < 9)
				if (@rolls == 0)
					if (pins == 10) #check for Strike
						@scores[@frames][@rolls] = 10
						@bonus[@frames] = 2
						resetRolls()
						incFrames()
					else 
						normScored(pins)
					end
				else
					@scores[@frames][@rolls] = pins
					if ((@scores[@frames][@rolls-1])+pins == 10) #check for Spare
						@bonus[@frames] = 1
					end
					resetRolls()
					incFrames()
				end
			elsif (@frames == 9)
				if (@rolls < 2)
					normScored(pins)
					if (pins == 10) #check for Strike, allow mult strike, but no bonus
						@lBonus = true
					elsif ((@rolls == 1)&&((@scores[@frames][@rolls-1])+pins == 10)) #check for Spare, but no bonus.
						@lBonus = true
					end
				elsif (@rolls == 2)
					if (@lBonus==false)
						puts "You didn't score the bonus throw."
						resetRolls()
						incFrames()
					elsif (@lBonus==true)
						@scores[@frames][@rolls] = pins
						resetRolls()
						incFrames()
					end
				end
			end
			#puts pins #for Debugging
			break
		end
	end
	def score() #return int
		tol = 0
		order = 0
		@scores.each do |calc|
			tol += calc[0]+calc[1]+calc[2]
			if(@bonus[order] == 2)
				tol += @scores[order+1][0]+@scores[order+1][1]
				if(@bonus[order+1] == 2)
					tol += @scores[order+2][0]
				end
			elsif(@bonus[order] == 1)
				tol += @scores[order+1][0]
			end
			order += 1
		end
		return tol
	end

	def incFrames()
		@frames += 1
	end
	def resetRolls()
		@rolls = 0
	end
	def incRolls()
		@rolls += 1
	end
	def normScored(tpin)
		@scores[@frames][@rolls] = tpin
		incRolls()
	end
	def reset()
		@scores.each do |init|
			init[0] = 0
			init[1] = 0
			init[2] = 0
		end
		@bonus.each do |init|
			init = 0
		end
		@frames = 0
		@rolls = 0
		@lBonus = false
	end
end
