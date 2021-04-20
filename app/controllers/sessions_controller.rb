class SessionsController < PermissionController
    before_action :authorized, only: [:auto_login]

    def login
      @user = User.find_by(name: params[:name])
      puts @user.name
      if @user && @user.authenticate(params[:password])
        token = encode_token({
          user_id: @user.id,
          exp: 30.days.from_now.to_i
        })
        render json: {user: @user, token: token}, status: :created
      else
        render json: {error: "Invalid username or password"}, status: :unauthorized
      end
    end
  
    def auto_login
      render json: 
      {
        loggedIn: true,
        user: @user
      }
    end
end
