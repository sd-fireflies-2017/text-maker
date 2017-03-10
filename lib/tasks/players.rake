namespace :players do
  desc "Sends out confirmation message to players"
  task message: :environment do
  	Team.all.each do |team|
	  	team.games.each do |game|
	  		next if game.full?
	  		game.players_without_confirmations.each do |player|
	  			if Roster.find_by(team: team, player: player).core == true
	  				# if player.name == 'jordan'
	  					CreateTwilioClient.new(player.phone_number, game.details).call
	  				end
	  		end
	  	end
	  end

  end

end
