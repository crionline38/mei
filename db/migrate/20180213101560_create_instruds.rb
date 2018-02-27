class CreateInstruds < ActiveRecord::Migration[5.0]
  def change
    create_table :instruds do |t|
      t.references :instrument, foreign_key: true
      t.references :discipline, foreign_key: true

      t.timestamps
    end
  end
end
