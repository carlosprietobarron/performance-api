class MeasuresController < ApplicationController
    def create
        measure = Measure.new(measure_params)
        if measure.valid?
            measure.save!
            render json: measure, status: :ok
        else
            #return error
            status = {"422" => "Unprocessable_entity"}
        render :json => [ measure, status ]
        end
        
    end 

    def indicatorMeasures
    end

    def measure_params
        params.require(:data).require(:attributes).permit(:measure, :day, :indicator_id)
    end
end
