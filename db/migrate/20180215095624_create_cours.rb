class CreateCours < ActiveRecord::Migration[5.0]
  def change
    create_table :cours do |t|
      t.references :student, foreign_key: true
      t.references :discipline, foreign_key: true
      t.references :instrument, foreign_key: true
      t.references :user, foreign_key: true
      t.references :year, foreign_key: true
    t.boolean :plus
    t.boolean :eco
    t.string :dispo
    t.integer :nbstudents
    t.integer :nbstudentshyp
    t.time :heure
    t.time :heurehyp
    t.integer :recurence
    t.integer :recurencehyp
    t.boolean :soumettre
    t.string :comments
      t.timestamps
    end
  end
end
