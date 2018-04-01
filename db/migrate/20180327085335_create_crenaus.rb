class CreateCrenaus < ActiveRecord::Migration[5.0]
  def change
    create_table :crenaus do |t|
      t.references :user, foreign_key: true
      t.references :year, foreign_key: true
      t.boolean :valide, :default => false
      t.references :discipline, foreign_key: true
      t.references :instrument, foreign_key: true
      t.integer :jour, :default => 0
      t.integer :recurence, :default => 0
      t.time :start, :default => "00:00"
      t.time :end, :default => "00:00"

      t.timestamps
    end
  end
end
