class PhotosController < ApplicationController

    def index
        photos = Photo.all
        render json: PhotoSerializer.new(photos)
    end


    def create
        photo = Photo.new(photo_params)
        if photo.save
            #session[:user_id] = user.id
            render json: PhotoSerializer.new(photo)
        else
            render json: {
                status: 401,
                main: photo.errors.as_json(full_messages: true) 
                }
        end
    end 


    private

    def photo_params
        params.require(:photo).permit(:url, :listing_id)
    end 





end
