class SplitnameEmployees < ActiveRecord::Migration
  def change
  	add_column :employees, :first, :string
  	add_column :employees, :second, :string
  	add_column :employees, :third, :string

  end
end
