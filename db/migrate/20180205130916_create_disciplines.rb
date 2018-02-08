class CreateDisciplines < ActiveRecord::Migration[5.0]
  def change
    create_table :disciplines do |t|
      t.string :name
      t.integer :duree
      t.references(:frequence)
      t.references(:tarif)
      t.boolean :valide
      t.boolean :fm
      t.timestamps
    end
  end
end
