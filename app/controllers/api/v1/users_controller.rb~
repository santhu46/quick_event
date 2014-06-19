
module Api
  module V1
    class UsersController < ApplicationController

  # GET /users/1.json
      def show
        @user = User.find(params[:id])
        respond_to do |format|
          format.json {  render :status => 200, :json => { :user => @user, :status => "Success" } }
        end
      end

  # POST /users.json
      def create
        @user = User.new(params[:user])
        respond_to do |format|
          if @user.save
            format.json {  render :status => 200, :json => { :user => @user, :status => "Success" } }
          else
            format.json { render :json => { :error => @user.errors ,:status => "Error"} }
          end
        end
      end

  # PUT /users/1.json
      def update
        @user = User.find(params[:id])

        respond_to do |format|
          if @user.update_attributes(params[:user])
            format.json {  render :status => 200, :json => { :user => @user, :status => "Success" } }
          else
            format.json { render :json => { :error => @user.errors ,:status => "Error"} }
          end
          end
      end

  # DELETE /users/1.json
      def destroy
        @user = User.find(params[:id])
        @user.destroy
        respond_to do |format|
          format.json {  render :status => 200, :json => { :status => "Success" } }
        end
      end
    end
  end
end
