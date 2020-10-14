class RequestsController < ApplicationController
    
    def index
        requests = Request.all
        render json: RequestSerializer.new(requests)
    end


    def create
        request = Request.new(request_params)
        if request.save
            #session[:user_id] = user.id
            render json: RequestSerializer.new(request)
        else
            render json: {
                status: 401,
                main: request.errors.as_json(full_messages: true) 
                }
        end
    end 


    private

    def request_params
        params.require(:request).permit(:name, :phone, :message, :buyer_id, :listing_id)
    end 

end
