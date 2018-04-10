class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    render json: @user
  end

  def new
    @user=User.new
  end

  def create
    user=User.new(name: params[:name],last_name: params[:last_name],email: params[:email],password: params[:password],address: params[:address])
    if @user.save
      render json: user
    end
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user= User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to :action=> 'show', :id=>@user
    else
      @user=user.find(:all)
      render json: @user
    end
  end

  def destroy
    @user=User.find(params[:id])
    @user.destroy
    redirect_to '/users/new', :notice=>"Your user has been Deleted"
  end
end
