class IndicatorSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :goal
end
