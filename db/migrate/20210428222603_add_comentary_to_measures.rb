# frozen_string_literal: true

# rubocop:disable Style/Documentation
class AddComentaryToMeasures < ActiveRecord::Migration[6.1]
  def change
    add_column :measures, :comentary, :text
  end
end
# rubocop:enable Style/Documentation
