class CreateDisciplines < ActiveRecord::Migration[5.0]
  def change
    create_table :disciplines do |t|
      t.string :name
      t.integer :duree
      t.references(:frequence)
      t.integer :tarif1
      t.integer :tarif2
      t.integer :tarif3

      t.timestamps
    end
  end
end
