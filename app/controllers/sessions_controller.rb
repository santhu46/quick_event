class SessionsController < ApplicationController
  def new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    user = User.find_by_email(params[:email])

    respond_to do |format|

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      format.html { redirect_to root_url, :notice => "Logged in!" }
      format.json {  render :status => 200, :json => { :user => user }   }
    else
      flash.now.alert = "Invalid email or password"
      format.html { render action: "new" }
      format.json { render json: user.errors, status: :unprocessable_entity,:json => { :error => "Invalid Credentails" } }
    end
    end
  end

 
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
