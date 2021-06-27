# frozen_string_literal: true

# rubocop:disable Style/Documentation
class AddDescriptionToIndicators < ActiveRecord::Migration[6.1]
  def change
    add_column :indicators, :description, :text
  end
end
# rubocop:enable Style/Documentation
