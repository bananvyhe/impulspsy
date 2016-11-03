class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :img
      t.string :name
      t.text :spec
      t.text :education
      t.text :addeducation
      t.text :programms

      t.timestamps null: false
    end
  end
end
