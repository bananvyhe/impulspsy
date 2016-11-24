class AddNumberToSliders < ActiveRecord::Migration
  def change
  	add_column :sliders, :number, :string
  end
end
