class IndicatorsController < ApiController
  def index
    @indicators = Indicator.all

    render json: serializer.new(@indicators)
  end

  def show
    @indicator = Indicator.find_by(id: params["id"])
    render json: serializer.new(@indicator)
  end

  def measures
    @indicator = Indicator.find_by(id: params["id"])
    #measures = @indicator.measures
    @measures = Measure.where(indicator_id: @indicator.id)
    
    render json: @measures , status: :ok
  end

  def serializer 
    IndicatorSerializer
  end
end
