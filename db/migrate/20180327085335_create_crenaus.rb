class CreateCrenaus < ActiveRecord::Migration[5.0]
  def change
    create_table :crenaus do |t|
      t.references :user, foreign_key: true
      t.references :year, foreign_key: true
      t.boolean :valide, :default => false
      t.references :discipline, foreign_key: true
      t.references :instrument, foreign_key: true
      t.string :jour
      t.integer :recurence
      t.time :start
      t.time :end

      t.timestamps
    end
  end
end
