class IndicatorSerializer < ActiveModel::Serializer
  attributes :id, :name, :goal, :image, :measures

  has_many :measures
end
