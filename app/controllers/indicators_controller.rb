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

    # @indicators.each do |item|

    #   for i in 10.times
    #   end
    # end
    
    render json: {
      loggedIn: true,
      result: JSON.parse(@indicators_json),
      message: 'Successfully retrieved Top Tens'
    }, adapter: :json
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
