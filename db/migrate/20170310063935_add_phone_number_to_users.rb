class AddPhoneNumberToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :phone_number, :string, null: false
  end
end
