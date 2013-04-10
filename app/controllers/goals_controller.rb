class GoalsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: [:destroy, :update]
  before_filter :get_goal,       only: [:show, :edit]

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @goal }
    end
  end

  def edit
  end

  def create
    @goal = current_user.goals.build(params[:goal])
    respond_to do |format|
      if @goal.save
        format.html { redirect_to root_url, notice: 'Goal was successfully created.' }
        format.json { render json: @goal, status: :created, location: @goal }
      else
        format.html { redirect_to root_url, alert: 'Failed to create goal.' }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @goal.update_attributes(params[:goal])
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @goal.destroy
    redirect_to root_url
  end

  private

    def get_goal
      @goal = Goal.find(params[:id])
    end

    def correct_user
      @goal = current_user.goals.find_by_id(params[:id])
      redirect_to root_url if @goal.nil?
    end

end
