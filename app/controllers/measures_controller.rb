class MeasuresController < PermissionController
  before_action :authorized
    
    def create
        @measure = Measure.new(
            day: params[:day],
            measure: params[:measure],
            comentary: params[:comentary],
            indicator_id: params[:indicator_id]
        )
        p @measure
        if @measure.valid?
            p @measure
            @measure.save!
            render json: @measure, status: :ok
        else
            #return error
            status = {"422" => "Unprocessable_entity"}
        render :json => [ @measure, status ]
        end
        
    end 
    
end
