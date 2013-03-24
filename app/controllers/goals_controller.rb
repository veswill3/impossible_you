class GoalsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: [:create, :destroy, :update]
  before_filter :get_user, only: [:new, :create, :edit, :update]

  # GET /goals
  # GET /goals.json
  def index
    @goals = Goal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @goals }
    end
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
    @goal = Goal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @goal }
    end
  end

  # GET /goals/new
  # GET /goals/new.json
  def new
    @goal = Goal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @goal }
    end
  end

  # GET /goals/1/edit
  def edit
    @goal = Goal.find(params[:id])
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = @user.goals.build(params[:goal])
    respond_to do |format|
      if @goal.save
        format.html { redirect_to user_goal_path(@user, @goal), notice: 'Goal was successfully created.' }
        format.json { render json: @goal, status: :created, location: @goal }
      else
        format.html { render action: "new" }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /goals/1
  # PUT /goals/1.json
  def update
    @goal = Goal.find(params[:id])

    respond_to do |format|
      if @goal.update_attributes(params[:goal])
        format.html { redirect_to user_goal_path(@user, @goal), notice: 'Goal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy

    redirect_to root_url
  end

  private

    def get_user
      @user = User.find(params[:user_id])
    end

    def correct_user
      @goal = current_user.goals.find_by_id(params[:id])
      flash[:error] = 'Incorrect user'
      redirect_to root_url if @goal.nil?
    end

end
