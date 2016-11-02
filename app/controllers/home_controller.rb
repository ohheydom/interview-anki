class HomeController < ApplicationController
  def show
    if user_signed_in?
      render 'logged_in_show'
    else
      render 'show'
    end
  end
end
