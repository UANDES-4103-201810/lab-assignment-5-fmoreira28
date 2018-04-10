class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
  end

  def new
    @user=User.new
    @users=User.find(:all)
  end

  def create
    @user=User.new([:name][:last_name][:email][:password][:address])
    if @user.save
      redirect_to @user
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
