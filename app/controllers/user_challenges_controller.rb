require 'hackerrank'

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
    challenge = current_user.user_challenges.find_by_challenge_id(params[:id])
    if challenge
      api_key = Rails.application.secrets.hackerrank_api_key
      hackerrank = HackerRank.new(api_key, params, challenge.challenge)
      @response = hackerrank.post
      respond_to do |format|
        format.html
        format.js { render '/challenges/submit' }
      end
    else
      flash[:error] = 'You cannot submit a challenge unless you have added it to your list.'
      redirect_to challenge_path(params[:id])
    end
  end
end
