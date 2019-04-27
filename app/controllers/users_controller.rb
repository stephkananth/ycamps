# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  # before_action :check_login, only: [:show, :edit, :update, :destroy]
  # authorize_resource

  # GET /users
  # GET /users.json
  def index
    @users = User.all.paginate(:page => params[:users]).per_page(10)
  end

  # GET /users/1
  # GET /users/1.json
  def show;
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit;
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      if @user.role == 'parent'
        @parent = Parent.new
        @parent.user_id = @user.id
        @parent.save
      elsif @user.role == 'counselor'
        @counselor = Counselor.new
        @counselor.user_id = @user.id
        @counselor.save
      end
      flash[:notice] = "Successfully added #{@user.email} as a user."
      redirect_to users_url
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update_attributes(user_params)
      flash[:notice] = 'Successfully updated your profile.'
      render action: 'show'
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if @user.role?(:parent)
      @parent = Parent.where(user_id: @user.id).first
      if @parent.destroy && @user.destroy
        redirect_to users_url, notice: "Successfully removed #{@user.email} from the YCHAT system."
      else
        render action: 'show'
      end
    elsif @user.role?(:counselor)
      @counselor = Counselor.where(user_id: @user.id).first
      if @counselor.destroy && @user.destroy
        redirect_to users_url, notice: "Successfully removed #{@user.email} from the YCHAT system."
      else
        render action: 'show'
      end
    else
      if @user.destroy
        redirect_to users_url, notice: "Successfully removed #{@user.email} from the YCHAT system."
      else
        render action: 'show'
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:role, :email, :first_name, :last_name, :password, :password_confirmation)
  end
end
