class AddTwitterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter_uid, :integer
    add_column :users, :twitter_info, :json
  end
end
