class AddFunctionToCours < ActiveRecord::Migration[5.0]
  def change
    add_column :cours, :plus, :boolean
    add_column :cours, :eco, :boolean
    add_column :cours, :comment, :string
    add_column :cours, :nbstudents, :integer
    add_column :cours, :nbstudentshyp, :integer
    add_column :cours, :heure, :time
    add_column :cours, :heurehyp, :time
    add_column :cours, :recurence, :integer
    add_column :cours, :recurencehyp, :integer
    add_column :cours, :soumettre, :boolean
  end
end
