require 'hackerrank'
require 'anki'

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

  def update_anki_dates
    challenge = current_user.user_challenges.find_by_challenge_id(params[:id])

    if challenge
      button_idx = params[:button].to_i
      if [0, 1, 2, 3].include?(button_idx)
        challenge_inverval = @challenge.interval
        challenge_reviews = @challenge.reviews
        anki_dates = Anki.new(challenge_interval, challenge_reviews).determine_next_dates
        interval = anki_dates[button_idx][1]
        challenge.update_due_date(interval)
        f_date = (DateTime.now + interval).strftime("%B #{(DateTime.now + interval).day.ordinalize}")
        flash[:notice] = "You're next review of this challenge will be on #{f_date}"
      else
        flash[:error] = "Invalid interval"
      end
    end
    redirect_to challenge_path(params[:id])
  end

  def submit
    challenge = current_user.user_challenges.find_by_challenge_id(params[:id])

    if challenge
      due_today = challenge.due_today?
      @anki_dates = false
      if due_today
        @anki_dates = Anki.new(challenge).determine_next_dates
      end

      api_key = Rails.application.secrets.hackerrank_api_key
      hackerrank = HackerRank.new(api_key, params, challenge.challenge)
      hr_response = hackerrank.post
      @results = hackerrank.parse_result(hr_response)
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
