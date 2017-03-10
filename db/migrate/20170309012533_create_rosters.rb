class CreateRosters < ActiveRecord::Migration[5.0]
  def change
    create_table :rosters do |t|
      t.integer 	:team_id, null: false
      t.integer 	:player_id, null: false
      t.boolean   :core
      t.timestamps(null: false)
    end
  end
end
