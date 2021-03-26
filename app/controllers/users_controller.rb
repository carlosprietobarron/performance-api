class UsersController < ApplicationController
    def create
      @user = User.new(user_params)

      if user.valid?
        @user.save 
        render json: @user, status: :ok

      else
        status = {"422" => "Unprocessable_entity"}
        render :json => [ @user, status ]
      end
    end

    def signin
       email = params["email"]
       pwd = params["password"]
       user = User.where(email: email)
       # render json: user, status: :ok
       signedin = true if user_valid_password?(email, pwd)
       if signedin
         @user = User.find_by(email: email)
         render json: @user, status: :ok
       else
         render json: [{"error": "Not Authorized"}, status: :unauthorized]
       end 
    end
private

    def user_params
        params.require(:data).require(:attributes).permit(:name, :email ,:password )
    end

    def user_valid_password?(email, pwd)
        @user = User.find_by(email: email)
        return true if @user.password === pwd
        false
    end
end
