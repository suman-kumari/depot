class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authorize, only: [:new, :create, :show]

  def index
    @users = User.order(:name).paginate(:page => params[:page] ,:per_page => 5)
  end

  def new
    @user = User.new
    @user.build_address
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to(user_path(@user), :notice => "User #{@user.name} was successfully created") }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def show
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to(users_url, :notice => "User #{@user.name} was successfully updated") }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def edit
  end

  def destroy
    @user.destroy
    render :layout => false if request.xhr?
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :confirm, :address_attributes => [:street_name, :city, :state , :country, :zipcode])
  end
end

