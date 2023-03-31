class UserAwardsController < ApplicationController
  before_action :set_user_award, only: %i[ show edit update destroy ]

  # GET /user_awards or /user_awards.json
  def index
    @user_awards = UserAward.all
  end

  # GET /user_awards/1 or /user_awards/1.json
  def show
  end

  # GET /user_awards/new
  def new
    @user_award = UserAward.new
  end

  # GET /user_awards/1/edit
  def edit
  end

  # POST /user_awards or /user_awards.json
  def create
    @user_award = UserAward.new(user_award_params)

    respond_to do |format|
      if @user_award.save
        format.html { redirect_to user_award_url(@user_award), notice: "User award was successfully created." }
        format.json { render :show, status: :created, location: @user_award }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_award.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_awards/1 or /user_awards/1.json
  def update
    respond_to do |format|
      if @user_award.update(user_award_params)
        format.html { redirect_to user_award_url(@user_award), notice: "User award was successfully updated." }
        format.json { render :show, status: :ok, location: @user_award }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_award.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_awards/1 or /user_awards/1.json
  def destroy
    @user_award.destroy

    respond_to do |format|
      format.html { redirect_to user_awards_url, notice: "User award was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_award
      @user_award = UserAward.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_award_params
      params.require(:user_award).permit(:user_id, :award_id)
    end
end
