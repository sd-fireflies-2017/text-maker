class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string    :location, null: false
      t.datetime  :time, null: false
      t.boolean   :home_team, null: false
      t.string    :opposing_team, null: false
      t.integer   :team_id, null: false
      t.integer   :players_required, null: false
      t.timestamps(null: false)
    end
  end
end
