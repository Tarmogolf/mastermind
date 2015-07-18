class MastermindGuess
	attr_accessor :right_spot_right_color
	attr_accessor :wrong_spot_right_color

	def initialize(guess, key)
		@right_spot_right_color = 0
		@wrong_spot_right_color = 0

		until(input_clean?(guess))
			puts "Bad input. Each digit must be 1-6 and the total code must be 4 digits. Try again."
			guess = gets.chomp
		end
		info = check_guess(guess, key)
	end

	def check_guess(guess, key)
		key = key.split("")
		guess = guess.split("")
		index = 0
		guess.each do |x|
			if(key[index].eql?(x))
				@right_spot_right_color+=1
				key[index] = 0
				guess[index] = 7				
			end
			index+=1
		end

		guess.each do |x|	
			if (key.include?(x))
				hash = Hash[key.map.with_index.to_a]
				key[hash[x]] = 0
				@wrong_spot_right_color+=1
			end
		end
	end

	def input_clean?(string)
		
		return false if string.size != 4

		arr = string.split("")

		arr = arr.map(&:to_i)

		arr.each do |x|
			return false if (x < 1 || x > 6)
		end

		true
	end

	def to_s
		"Right spot & number: #{@right_spot_right_color} \nRight number wrong spot: #{@wrong_spot_right_color}"
	end

end
