
require "spec_helper"
require "Game" # name of the class we have just created

describe Game do
	describe "#score" do
		it "Perfect Strike Game Score" do
			run = Game.new()
			order = 0
			while(order < 12+2)
				run.roll(10)
				order += 1
			end
			expect(run.score()).to eq(300)
		end
		it "Perfect Spare Game Score" do
			run2 = Game.new()
			order2 = 0
			while(order2 < 21+3)
				run2.roll(5)
				order2 += 1
			end
			expect(run2.score()).to eq(150)
		end
		it "Misc Game Score" do
			run3 = Game.new()
			
			run3.roll(3)
			run3.roll(7)

			run3.roll(1)
			run3.roll(2)

			run3.roll(3)
			run3.roll(4)

			run3.roll(5)
			run3.roll(2)

			run3.roll(9)
			run3.roll(0)

			run3.roll(0)
			run3.roll(0)

			run3.roll(1)
			run3.roll(2)

			run3.roll(3)
			run3.roll(6)

			run3.roll(10)
			run3.roll(0)

			run3.roll(1)
			run3.roll(2)
			run3.roll(3)

			expect(run3.score()).to eq(61)
		end
	end
end
