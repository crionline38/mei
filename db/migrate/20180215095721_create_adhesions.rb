class CreateAdhesions < ActiveRecord::Migration[5.0]
  def change
    create_table :adhesions do |t|
      t.references :year, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
