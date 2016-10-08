class CreateOtzivs < ActiveRecord::Migration
  def change
    create_table :otzivs do |t|
      t.string :author
      t.text :text

      t.timestamps null: false
    end
  end
end
