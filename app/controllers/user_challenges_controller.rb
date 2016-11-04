class UserChallengesController < ApplicationController
  def create
    user_challenge = current_user.user_challenges.new(challenge_id: params[:id])
    if user_challenge.save
      flash[:notice] = 'Challenge has been added to your list.'
      redirect_to challenge_path(params[:id])
    else
    end
  end

  def destroy
    user_challenge = current_user.user_challenges.find_by_challenge_id(params[:id])
    if user_challenge
      if user_challenge.delete
        flash[:notice] = 'Challenge has been deleted from your list.'
        redirect_to challenge_path(params[:id])
      end
    end
  end

  def submit
    if current_user.user_challenges.find_by_challenge_id(params[:id])
    else
      flash[:error] = 'You cannot submit a challenge unless you have added it to your list.'
      redirect_to challenge_path(params[:id])
    end
  end
end
