class ChangeEmailToUsers < ActiveRecord::Migration[5.0]
  def self.up
    change_column :users, :email, :string, null: true, default: ""
    change_column :users, :encrypted_password, :string, null: true, default: ""
  end
end
