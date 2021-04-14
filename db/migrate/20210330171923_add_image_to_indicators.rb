class AddImageToIndicators < ActiveRecord::Migration[6.1]
  def change
    add_column :indicators, :image, :string
  end
end
