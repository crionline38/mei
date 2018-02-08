class AddAttributeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :year, :integer
    add_column :users, :address, :string
    add_column :users, :tel1, :string
    add_column :users, :tel2, :string
    add_column :users, :rib, :boolean
    add_column :users, :adhesion_year, :integer
    add_column :users, :adhesion_num, :integer
    add_column :users, :address2, :string
    add_column :users, :zipcode, :string
    add_column :users, :city, :string
  end
end
