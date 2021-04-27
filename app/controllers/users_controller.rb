class UsersController < PermissionController
  skip_before_action :authorized, only: [:create]

    def create
      @user = User.new(user_params)

      if @user.save && @user.valid? 
        token = encode_token({
          user_id: @user.id,
          exp: 30.days.from_now.to_i
        })
        render json: {user: @user, token: token}, status: :created
      else
        render json: {error: "Invalid username or password"}, status: :unauthorized
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
        params.require(:data).require(:attributes).permit(:name, :email ,:password_digest )
    end

    def user_valid_password?(email, pwd)
        @user = User.find_by(email: email)
        return true if @user.password_digest === pwd
        false
    end
end
