class ChangeNameToCours < ActiveRecord::Migration[5.0]
  def change
    rename_column :cours, :comment, :dispo
  end
end
