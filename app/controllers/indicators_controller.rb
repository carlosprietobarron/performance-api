# frozen_string_literal: true

# rubocop:disable Style/Documentation, Metrics/MethodLength, Metrics/AbcSize
require 'json'
class IndicatorsController < PermissionController
  before_action :authorized

  def index
    @indicators = Indicator.all
    @indicators_json = @indicators.to_json(
      include: { measures: { only: %i[day measure comentary] } },
      except: %i[created_at updated_at]
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
    @indicator = Indicator.find_by(id: params['id'])
    @indicator_json = @indicator.to_json(
      include: { measures: { only: %i[day measure comentary] } },
      except: %i[created_at updated_at]
    )
    @indicators_serial = serializer.new(@indicators)
    @filtered_ind = []
    render json: {
      loggedIn: true,
      result: JSON.parse(@indicator_json),
      message: 'Successfully retrieved Indicator'
    }, adapter: :json
  end

  def create
    puts 'params'
    puts params
    @indicator = Indicator.new(
      name: params[:name],
      goal: params[:goal],
      description: params[:description],
      image: 'https://i.ibb.co/2vgCGV5/uconstruction.jpg'
    )

    if @indicator.save
      @indicator_json = @indicator.to_json
      @indicators_serial = serializer.new(@indicators)
      render json: {
        loggedIn: true,
        result: JSON.parse(@indicator_json),
        message: 'Successfully created Indicator',
        status: 'created'
      }, adapter: :json
    else
      render json: { message: 'Indicator not created' }, status: :unprocessable_entity
    end
  end

  def serializer
    IndicatorSerializer
  end
end
# rubocop:enable Style/Documentation, Metrics/MethodLength, Metrics/AbcSize
