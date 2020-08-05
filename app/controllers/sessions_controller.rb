class SessionsController < ApplicationController

    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            render json: UserSerializer.new(user)
            #render json: {
            #    user: UserSerializer.new(user),
            #    currentUser: current_user}
        else
            render json: {
                status: 401,
                #main: user.errors.as_json(full_messages: true)
                failedUserInfor: params
            }
        end
    end 

    def get_current_user
        if logged_in?
            render json: current_user
        else
            render json: {
                error: "not logged in."
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