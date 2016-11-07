class HomeController < ApplicationController
  def show
    if user_signed_in?
      @challenges = current_user.user_challenges.due_today
      render 'logged_in_show'
    else
      render 'show'
    end
  end
end
