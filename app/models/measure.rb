class Measure < ApplicationRecord
    validates :measure, presence: true, numericality: {greater_than: -1 }

    belongs_to :indicator
end
