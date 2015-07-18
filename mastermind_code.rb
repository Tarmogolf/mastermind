#require "./mastermind_guess.rb"

class MastermindCode

	attr_accessor :code

	def initialize(mode, user_input = "1111")
		until(mode == :user_generated || mode == :randomly_generated)
			puts "Must be :user_generated or :randomly_generated, try again"
			@mode = gets.chomp.to_sym
		end

		@code = (mode == :user_generated ? user_code(user_input) : random_code)
	end

	def user_code(s)
		s
	end

	def random_code
		s = ""
		4.times do 
			s += (1 + rand(6)).to_s
		end

		s
	end

end
