class EventsController < ApplicationController
  # GET users/1/events
  # GET users/1/events.json
  def index
    @user = User.find(params[:user_id])
    @events = @user.events

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @events }
    end
  end

  # GET users/1/events/1
  # GET users/1/events/1.json
  def show
    @user = User.find(params[:user_id])
    @event = @user.events.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @event }
    end
  end

  # GET users/1/events/new
  # GET users/1/events/new.json
  def new
    @user = User.find(params[:user_id])
    @event = @user.events.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @event }
    end
  end

  # GET users/1/events/1/edit
  def edit
    @user = User.find(params[:user_id])
    @event = @user.events.find(params[:id])
  end

  # POST users/1/events
  # POST users/1/events.json
  def create
    @user = User.find(params[:user_id])
    @event = @user.events.build(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to([@event.user, @event], :notice => 'Event was successfully created.') }
        format.json { render :json => @event, :status => :created, :location => [@event.user, @event] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT users/1/events/1
  # PUT users/1/events/1.json
  def update
    @user = User.find(params[:user_id])
    @event = @user.events.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to([@event.user, @event], :notice => 'Event was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE users/1/events/1
  # DELETE users/1/events/1.json
  def destroy
    @user = User.find(params[:user_id])
    @event = @user.events.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to user_events_url(user) }
      format.json { head :ok }
    end
  end
end
