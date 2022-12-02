class AddUserImageUrlToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_image_url, :string
  end
end
