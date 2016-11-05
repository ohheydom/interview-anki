require 'uri'
require 'net/http'
require 'net/https'
require 'rest-client'


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
    url = 'http://api.hackerrank.com/checker/submission.json'
    challenge = current_user.user_challenges.find_by_challenge_id(params[:id])
    if challenge
      challenge = challenge.challenge
      new_ps = {}
      new_ps[:source] = params[:code] + "\n" + challenge.boilerplate_code
      new_ps[:testcases] = challenge.test_case_input.split(",").to_json
      new_ps[:lang] = challenge.language
      new_ps[:api_key] = Rails.application.secrets.hackerrank_api_key
      @val = get_api_call(url, new_ps)
      respond_to do |format|
        format.html
        format.js { render '/challenges/submit' }
      end
    else
      flash[:error] = 'You cannot submit a challenge unless you have added it to your list.'
      redirect_to challenge_path(params[:id])
    end
  end

  private
  def get_api_call(url, args_hash)
    RestClient.post(url, args_hash)
  end
end
