# frozen_string_literal: true

# rubocop:disable Style/Documentation
class AddImageToIndicators < ActiveRecord::Migration[6.1]
  def change
    add_column :indicators, :image, :string
  end
end
# rubocop:enable Style/Documentation
