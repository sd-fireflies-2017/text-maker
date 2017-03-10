class CreateCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :codes do |t|
      t.integer 		:value, presence: true, default: 100
      t.references 	:game, foreign_key: true

      t.timestamps(null: false)
    end
  end
end
