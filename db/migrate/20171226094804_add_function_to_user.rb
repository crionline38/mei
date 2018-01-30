class AddFunctionToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :function, foreign_key: true
  end
end
