class ZipcodesController < ApplicationController
    def show
        api_key = ENV["zipwise_api_key"]

        zip_to_search = params[:zipcode]
        raidus_to_search = params[:radius]

        zips = JSON.parse( RestClient.get("https://www.zipwise.com/webservices/radius.php?key=#{api_key}&zip=#{zip_to_search}&radius=#{raidus_to_search}&format=json") )
        #zips = JSON.parse( RestClient.get("https://www.zipwise.com/webservices/radius.php?key=#{api_key}&zip=90210&radius=2&format=json") )

        #need listing = Listing.find_by(id: params[:id])

        if zips
            render json: zips
        else 
            render json: {message: 'zip not found'}
        end 

    end

    #check the permit names
    def zipcodes_params
        params.require(:zipcode).permit(:zipcode, :radius)
    end 

end