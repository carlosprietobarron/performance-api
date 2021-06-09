# frozen_string_literal: true

class MeasureSerializer < ActiveModel::Serializer
  attributes :id, :measure, :day, :comentary

#  belongs_to :indicator
end
