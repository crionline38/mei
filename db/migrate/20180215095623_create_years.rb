class CreateYears < ActiveRecord::Migration[5.0]
  def change
    create_table :years do |t|
      t.string :name
      t.boolean :valide

      t.timestamps
    end
  end
end
