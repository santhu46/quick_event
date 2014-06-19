
module Api
  module V1
   class EventsController < ApplicationController
  # GET users/1/events.json
  #before_filter :restrict_access
    def index
      @user = User.find(params[:user_id])
      @events = @user.events

      respond_to do |format|
      format.json { render :json => @events }
      end
    end

  # GET users/1/events/1.json
    def show
      @user = User.find(params[:user_id])
      @event = @user.events.find(params[:id])

      respond_to do |format|
      format.json { render :json => @event }
      end
    end

  # POST users/1/events.json
    def create
      @user = User.find(params[:user_id])
      @event = @user.events.build(params[:event])

      respond_to do |format|
        if @event.save
        format.json { render :json => @event, :status => :created, :location => [@event.user, @event] }
        else
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
        end
      end
    end

  # PUT users/1/events/1.json
    def update
      @user = User.find(params[:user_id])
      @event = @user.events.find(params[:id])

      respond_to do |format|
        if @event.update_attributes(params[:event])
          format.json { head :ok }
        else
          format.json { render :json => @event.errors, :status => :unprocessable_entity }
        end
      end
    end

  # DELETE users/1/events/1.json
    def destroy
      @user = User.find(params[:user_id])
      @event = @user.events.find(params[:id])
      @event.destroy

      respond_to do |format|
        format.json { head :ok }
      end
    end
   end
  end
end
