class RemoveImageFromSliders < ActiveRecord::Migration
  change_table :sliders do |t|
  t.remove :sliders, :image
  end
end
