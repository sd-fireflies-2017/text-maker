class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.string :phone_number, null: false
      t.timestamps(null: false)
    end
  end
end