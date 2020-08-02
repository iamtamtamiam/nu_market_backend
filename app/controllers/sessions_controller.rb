class SessionsController < ApplicationController

    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            render json: UserSerializer.new(user)
        else
            render json: {
                status: 401,
                #main: user.errors.as_json(full_messages: true)
                failedUserInfor: params
            }
        end
    end 

    def destroy
        session.destroy
        render json: {
            session: session[:user_id],
            #current_user: current_user,
            message: "you are logged out"
        }
    end 



end 