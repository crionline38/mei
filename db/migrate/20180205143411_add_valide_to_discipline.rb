class AddValideToDiscipline < ActiveRecord::Migration[5.0]
  def change
    add_column :disciplines, :valide, :boolean
    add_column :disciplines, :fm, :boolean
  end
end
