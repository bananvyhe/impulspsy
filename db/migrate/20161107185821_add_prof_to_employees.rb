class AddProfToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :prof, :text
  end
end
