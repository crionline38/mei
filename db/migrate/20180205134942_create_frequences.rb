class CreateFrequences < ActiveRecord::Migration[5.0]
  def change
    create_table :frequences do |t|
      t.string :name
    end
  end
end
