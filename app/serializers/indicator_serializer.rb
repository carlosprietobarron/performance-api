class IndicatorSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :goal, :image, :measures

  has_many :measures
end
