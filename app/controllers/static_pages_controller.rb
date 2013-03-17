class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @user  = current_user
      @goals = current_user.goals.paginate(page: params[:page])
    end
  end

  def about
  end
end
