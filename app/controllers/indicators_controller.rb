require "json"
class IndicatorsController < PermissionController
  before_action :authorized

  def index
    @indicators = Indicator.all
    @indicators_json = @indicators.to_json(
      :include => {:measures => {:only =>[:day, :measure, :comentary]}},
      :except => [:created_at, :updated_at]
    )
    @indicators_serial = serializer.new(@indicators)
    @filtered_ind = []

        
    render json: {
      loggedIn: true,
      result: JSON.parse(@indicators_json),
      message: 'Successfully retrieved Indicators'
    }, adapter: :json
  end

  def show
    @indicator = Indicator.find_by(id: params["id"])
    @indicator_json = @indicator.to_json(
      :include => {:measures => {:only =>[:day, :measure, :comentary]}},
      :except => [:created_at, :updated_at]
    )
    @indicators_serial = serializer.new(@indicators)
    @filtered_ind = []
    render json: {
      loggedIn: true,
      result: JSON.parse(@indicator_json),
      message: 'Successfully retrieved Indicators'
    }, adapter: :json
  end

  def create
    @indicator = Indicator.new(
      name: params[:name],
      goal: params[:goal],
      image: "../public/assets/uconstruction.jpg"
    )

    if @indicator.save
      render json: @indicator, status: :created
    else
      render json: {message: 'Indicator not created'}, status: :unprocessable_entity
    end
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
