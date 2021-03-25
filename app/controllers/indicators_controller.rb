class IndicatorsController < ApplicationController
  def index
    @indicators = Indicator.all

    render json: serializer.new(@indicators)
  end

  def serializer 
    IndicatorSerializer
  end
end
