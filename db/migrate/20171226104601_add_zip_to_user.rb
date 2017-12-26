class AddZipToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :address2, :string
    add_column :users, :zipcode, :string
    add_column :users, :city, :string
  end
end
