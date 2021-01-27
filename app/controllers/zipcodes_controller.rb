class ZipcodesController < ApplicationController
    def show
        api_key = ENV["zipwise_api_key"]
        zips = JSON.parse( RestClient.get("https://www.zipwise.com/webservices/radius.php?key=#{api_key}&zip=90210&radius=2&format=json") )

        if zips
            render json: zips
        else 
            render json: {message: 'zip not found'}
        end 


    end

end