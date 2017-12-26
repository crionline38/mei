class DelUserToFunction < ActiveRecord::Migration[5.0]
  def change
    remove_column :functions, :user_id
  end
end
