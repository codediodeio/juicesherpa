class AddSoftUserTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :soft_user_token, :string
  end
end
