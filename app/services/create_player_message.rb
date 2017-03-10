class CreatePlayerMessage

	def initialize(phone_number, message)
		@phone_number = phone_number
		@message = message
	end	

	def call
		reply = @message[1]
		puts "HERE IS THE REPLY #{reply}"
		puts "HER IS THE PHONE NUMBER #{@phone_number}"
		player = Player.find_by(phone_number: @phone_number)
		puts "HERE IS THE Player #{player.name}"
		if @message.length > 2
			game_number = @message.last
			puts "HERE IS HE game_number #{game_number}"
			game = Game.find_by(id: game_number)
			if reply == "yes"
				confirmation = Confirmation.find_or_initialize_by(player_id: player.id, game_id: game.id)
				confirmation.confirmed = true
				confirmation.save 
				message = "Confirmed for Game #{game.id} " + game.details
			elsif reply == "no"
				confirmation = Confirmation.find_or_initialize_by(player_id: player.id, game_id: game.id)
				confirmation.confirmed = false
				confirmation.save
				message = "Thank you"
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