class UserEventAwardsController < ApplicationController
  before_action :set_user_event_award, only: %i[ show edit update destroy ]

  # GET /user_event_awards or /user_event_awards.json
  def index
    @user_event_awards = UserEventAward.all
  end

  # GET /user_event_awards/1 or /user_event_awards/1.json
  def show
  end

  # GET /user_event_awards/new
  def new
    @user_event_award = UserEventAward.new
  end

  # GET /user_event_awards/1/edit
  def edit
  end

  # POST /user_event_awards or /user_event_awards.json
  def create
    @user_event_award = UserEventAward.new(user_event_award_params)

    respond_to do |format|
      if @user_event_award.save
        format.html { redirect_to user_event_award_url(@user_event_award), notice: "User event award was successfully created." }
        format.json { render :show, status: :created, location: @user_event_award }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_event_award.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_event_awards/1 or /user_event_awards/1.json
  def update
    respond_to do |format|
      if @user_event_award.update(user_event_award_params)
        format.html { redirect_to user_event_award_url(@user_event_award), notice: "User event award was successfully updated." }
        format.json { render :show, status: :ok, location: @user_event_award }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_event_award.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_event_awards/1 or /user_event_awards/1.json
  def destroy
    @user_event_award.destroy

    respond_to do |format|
      format.html { redirect_to user_event_awards_url, notice: "User event award was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_event_award
      @user_event_award = UserEventAward.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_event_award_params
      params.require(:user_event_award).permit(:description, :user_id, :event_id, :award_id)
    end
end
