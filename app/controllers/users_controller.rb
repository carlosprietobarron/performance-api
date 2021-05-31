# frozen_string_literal: true

# rubocop:disable Style/Documentation, Metrics/AbcSize, Metrics/MethodLength, Style/CaseEquality
class UsersController < PermissionController
  skip_before_action :authorized, only: [:create]
  # skip_before_action :verify_authenticity_token, :only => [:create]

  def create
    puts "params #{params}"
    @user = User.new(
      name: params['name'],
      email: params['email'],
      password: params['password'],
      password_confirmation: params['password_confirmation']
    )

    if params['password'] != params['password_confirmation']
      render json: {
        user: [],
        token: '',
        status: 401,
        message: 'Failed to sign up, please confirm password'
      }
      return
    end

    if @user.save && @user.valid?
      token = encode_token({
                             user_id: @user.id,
                             exp: 30.days.from_now.to_i
                           })
      render json: {
        user: @user,
        token: token,
        status: 201,
        message: 'Log in successful'
      }
    else
      render json: {
        user: [],
        token: '',
        status: 401,
        message: 'Failed to sign up, please try again'
      }
    end
  end

  private

  def user_params
    params.require(:data).permit(:name, :email, :password_digest)
  end

  def user_valid_password?(email, pwd)
    @user = User.find_by(email: email)
    return true if @user.password_digest === pwd

    false
  end
end
# rubocop:enable Style/Documentation, Metrics/AbcSize, Metrics/MethodLength, Style/CaseEquality
