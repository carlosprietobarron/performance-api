class Indicator < ApplicationRecord
    validates :name, presence: true

    has_many :measures
end
