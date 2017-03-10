class CreateUserMessage

	def initialize(message)
		# @phone_number = set_phone(phone_number)
		@message = message
	end	
	
	def call
		reply = @message[1]
		puts "HERE IS THE REPLY #{reply}"
		if @message.length > 2
			game_number = @message.last
			puts "HERE IS HE game_number #{game_number}"
			game = Game.find_by(id: game_number)
			if reply == "status"
				message = game.status
			end
		else
			if reply == "games"
				puts "HI HELLO HOW ARE YOU"
				message = []
				player.games.each do |game|
					message << game.details
				end
				# puts player.games.count
				message = message.join(" ")
			end
		end
		puts message
		message
	end



end