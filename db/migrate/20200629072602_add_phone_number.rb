class AddPhoneNumber < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :PhoneNumber, :string , null: false, unique: true, default:""
  end
end
