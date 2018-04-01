class CreateTarifs < ActiveRecord::Migration[5.0]
  def change
    create_table :tarifs do |t|
      t.string :name
      t.float :a
      t.float :b
      t.float :c
      t.boolean :valide, :default => true

      t.timestamps
    end
  end
end
