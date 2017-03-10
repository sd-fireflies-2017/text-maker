class CreateGameMessages 

	def initialize(phone_number, body)
		@phone_number = set_phone(phone_number)
		@body = body
	end	

	def determine_response
		message = @body.split(" ")
		
		# client = message.first	
		# client = determine_client(client, @phone_number, message)
		client.call
	end
			
	private 

	def determine_client(client, phone_number, message)
		if client.downcase.capitalize.constantize == User
			CreateUserMessage.new(message)
		else
			CreatePlayerMessage.new(phone_number, message)
		end
	end


	def set_phone(phone_number)
		phone_number.gsub(/\D/, "").slice(1..-1)
	end


end

