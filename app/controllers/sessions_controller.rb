class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :update, :destro

  # GET /sessions/1
  # def show
  #   render json: @session
  # end

  # POST /sessions
  def create
    user = User.find_by(email: params[:email])
  if user&.authenticate(params[:password_digest])
    session[:user_id] = user.id
    redirect_to root_url, notice: "Logged in!"
  else
    alert = "Email or password is invalid"
    render "new"
  end
end

    # @session = Session.new(session_params)

    # if @session.save
    #   render json: @session, status: :created, location: @session
    # else
    #   render json: @session.errors, status: :unprocessable_entity

  # PATCH/PUT /sessions/1
  def update
    if @session.update(session_params)
      render json: @session
    else
      render json: @session.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sessions/1
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
  
  
    # @session.destroy

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def session_params
      params.fetch(:session, {})
    end
end
