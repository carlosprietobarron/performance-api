# frozen_string_literal: true

# rubocop:disable Style/Documentation
class CreateMeasures < ActiveRecord::Migration[6.1]
  def change
    create_table :measures do |t|
      t.integer :measure
      t.date :day

      t.timestamps
    end
  end
end
# rubocop:enable Style/Documentation
