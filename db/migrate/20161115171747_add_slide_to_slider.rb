class AddSlideToSlider < ActiveRecord::Migration
  def change
    add_column :sliders, :slide, :string
  end
end
