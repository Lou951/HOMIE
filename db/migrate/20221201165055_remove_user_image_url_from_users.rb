class RemoveUserImageUrlFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :user_image_url, :string
  end
end
