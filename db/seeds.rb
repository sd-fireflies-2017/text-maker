# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Team.delete_all
Game.delete_all
Player.delete_all
Roster.delete_all
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email

phone_numbers = %w(1 2 3 4 5 6 7 8 9 0)

2.times {User.create!(name: Faker::StarWars.character,
											email: Faker::Internet.email,
											password: "password",
											password_confirmation: "password",
											phone_number: Faker::PhoneNumber.cell_phone)
}

2.times {User.create!(name: Faker::HarryPotter.character,
											email: Faker::Internet.email,
											password: "password",
											password_confirmation: "password",
											phone_number: Faker::PhoneNumber.cell_phone)
}

User.create!(name: "jordan",
							email: "jordan@jordan.com",
							password: "password",
							password_confirmation: "password",
							phone_number: "(760)5791733")

7.times {Team.create!(name: Faker::Team.name,
											sport_type: Faker::Team.sport,
											league_name: Faker::Team.creature,
											user_id: [1,2,3,4,5].sample)


}

23.times {Game.create!(location: Faker::GameOfThrones.city,
												time: Faker::Time.forward(23, :morning),
												home_team: ['true','false'].sample,
												opposing_team: Faker::Educator.university,
												team_id: rand(1..7),
												players_required: rand(4..8)
)}

77.times {Player.create!(name: Faker::Name.name,
													phone_number: phone_numbers.shuffle
													)
}

Player.create!(name: "jordan", phone_number: "(760)5791733")

78.times {Roster.create!(team_id: rand(1..7),
													player_id: rand(1..78),
													core: [true,true,true,false].sample
													)
}


User.create(email: 'david@gmail.com', name: 'david', password: 'password', phone_number: Faker::PhoneNumber.cell_phone)
