class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
    	t.string 		:name, null: false
    	t.string		:sport_type, null: false
    	t.string		:league_name, null: false
    	t.integer 	:user_id, null: false
      t.string    :default_location
      t.integer   :default_required_players
      t.timestamps(null: false)
    end
  end
end
