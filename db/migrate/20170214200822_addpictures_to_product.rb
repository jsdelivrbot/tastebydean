class AddpicturesToProduct < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :pictures, :text
  end
end
