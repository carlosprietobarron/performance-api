# frozen_string_literal: true

# rubocop:disable Style/Documentation
class AddIndicatorReferenceToMeasures < ActiveRecord::Migration[6.1]
  def change
    add_reference :measures, :indicator, null: false, foreign_key: true
  end
end
# rubocop:enable Style/Documentation
