class CreateGameMessages 
def determine_response(phone_number, body)
		# first determine if the client is a player or a user/captain
		# if they are a player confirm or deny they will be attending a game

		# if they are user determin appopriate status update


		client = Player.find_by(phone_number: phone_number)
		
		if client.nil?
			client = User.find_by(phone_number: phone_number)
		end



		
		
	end
end