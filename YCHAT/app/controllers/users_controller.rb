class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  # before_action :check_login, only: [:show, :edit, :update, :destroy]
  # authorize_resource

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @users = User.all.paginate(page: params[:users]).per_page(10)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user.role = 'counselor' if current_user.role?(:counselor)
    @user.role = 'admin' if current_user.role?(:admin)
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.role = 'counselor' if current_user.role?(:counselor)
    @user.role = 'admin' if current_user.role?(:admin)
    if @user.save
      flash[:notice] = "Successfully added #{@user.username} as a user."
      redirect_to users_url
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update_attributes(user_params)
      flash[:notice] = "Successfully updated #{@user.username}."
      redirect_to users_url
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if @user.destroy
      redirect_to users_url, notice: "Successfully removed #{@user.username} from the YCHAT system."
    else
      render action: 'show'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:active, :username, :role, :email, :phone, :password, :password_confirmation)
  end
end
