class Measure < ApplicationRecord
    validates :measure, presence: true, numericality: {greater_than: -1 }

    belongs_to :indicator
    
    #default_scope { where(day: >= (Date.today - 5))}
    default_scope -> { where ("day >=  '#{Date.today - 60}'")}
end
