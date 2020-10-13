class ListingsController < ApplicationController
    def index
        listings = Listing.all
        render json: ListingSerializer.new(listings)
    end



    def create
        listing = Listing.new(listing_params)
        if listing.save
            #session[:user_id] = user.id
            render json: ListingSerializer.new(listing)
        else
            render json: {
                status: 401,
                main: listing.errors.as_json(full_messages: true) 
                }
        end
    end 


    def show
        listing = Listing.find_by(id: params[:id])
        if listing
            #render json: user
            render json: ListingSerializer.new(listing)
        else 
            render json: {message: 'listing not found'}
        end
    end 

    def update
        listing = Listing.find_by(id: params[:id])
       
        if listing.update(listing_params)
          render json:  ListingSerializer.new(listing), status: :ok
        else
            render json: {
                status: 401,
                main: listing.errors.as_json(full_messages: true) 
                }
        end
      end


    def destroy
        listing = Listing.find_by(id: params[:id])
        if listing.destroy
            render json: {data: "Listing has been deleted."}
        else
            render json:{
                error: "error! not able to destroy"
            }
        end

    end 


    private

    def listing_params
        params.require(:listing).permit(:item, :description, :price, :condition, :status, :zipcode, :contact, :seller_id, :buyer_id)
    end 

end