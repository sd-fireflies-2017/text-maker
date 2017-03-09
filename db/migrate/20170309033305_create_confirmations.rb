class CreateConfirmations < ActiveRecord::Migration[5.0]
  def change
    create_table :confirmations do |t|
      t.integer :player_id, null:false
      t.integer :game_id, null:false
      t.boolean :confirmed, null:false

      t.timestamps(null:false)
    end
  end
end
