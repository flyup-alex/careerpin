class AddColumnToUsers < ActiveRecord::Migration
  def change

  	add_column :users, :company_name, :string
  	add_column :users, :phone, :string
  	add_column :users, :adress, :string
  end
end
