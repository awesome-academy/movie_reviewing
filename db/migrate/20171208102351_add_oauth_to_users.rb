class AddOauthToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :uid, :string
    add_column :users, :oauth_exprires_at, :datetime
  end
end
