class UserController < ApplicationController
    def index
        @users = User.all 
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new

        if user.save!
            redirect_to user_path
        else
            render: new
        end
    end

    def update
        @user = User.find(params[:id])

        if @user.update(allowed_params)
            redirect_to @user
        else
            render 'edit'
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy

        redirect_to users_path
    end

    private

    def allowed_params
      params.require(:user).permit(:name, :birthday, :email)
    end
end
