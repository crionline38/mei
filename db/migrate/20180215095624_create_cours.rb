class CreateCours < ActiveRecord::Migration[5.0]
  def change
    create_table :cours do |t|
      t.references :student, foreign_key: true
      t.references :discipline, foreign_key: true
      t.references :instrument, foreign_key: true
      t.references :user, foreign_key: true
      t.references :year, foreign_key: true

      t.timestamps
    end
  end
end
