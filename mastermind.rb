require "./mastermind_code.rb"
require "./mastermind_guess.rb"

class Mastermind
 	
	def initialize(mode, code = nil)
		@code = MastermindCode.new(mode, code)
		@mode = mode
		@turn_limit = 1000
		@prev_guess = ""
	end

	def play_game
		
		turn_count = 1
		exact_right = 0
		puts "Enter a 4 digit code. Each individual must be between 1 and 6"
		puts "-------------------------------------------------------------"
		
		until (turn_count > @turn_limit || exact_right == 4)
			puts "\nTurn #{turn_count}"
			exact_right = (@mode == :randomly_generated ? human_guesser : cpu_guesser(exact_right))
			turn_count +=1
		end

		puts exact_right == 4? "great, you win!" : "you lose, here's the code"
		puts @code.code
	end

	def human_guesser
		my_guess = input_guess
		puts my_guess.to_s
		exact_right = my_guess.right_spot_right_color
	end

	def cpu_guesser(num_right)
		do_not_check = []
		num_right.times do 
			while do_not_check.include?(i = rand(4))
			end
			do_not_check << i
		end
		
		hash = {}
		counter = 0
		4.times do |x|
			unless do_not_check.include?(counter)
				x = (1 + rand(6)).to_s
				hash[counter] = x
			else
				hash[counter] = @prev_guess[counter]
			end

			counter+=1
		end

		cpu_input = ""
		hash.each {|key, value| cpu_input += value}
		cpu_guess = MastermindGuess.new(cpu_input, @code.code)
		@prev_guess = cpu_input
		puts cpu_input
		puts cpu_guess.to_s
		exact_right = cpu_guess.right_spot_right_color
	end

	def input_guess
		my_code = gets.chomp
		guess = MastermindGuess.new(my_code, @code.code)
	end

end

game = Mastermind.new(:user_generated, "1532")
game.play_game