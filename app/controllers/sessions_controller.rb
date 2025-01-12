class SessionsController < ApplicationController

    def new
        @user = User.all
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        @user = @user.try(:authenticate, params[:user][:password])
        return redirect_to root_path unless @user
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end



    def destroy
        session.clear
        redirect_to "/"
    end
end
