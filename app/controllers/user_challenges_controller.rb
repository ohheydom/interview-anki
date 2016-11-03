class UserChallengesController < ApplicationController
  def create
    user_challenge = current_user.user_challenges.new(challenge_id: params[:id])
    if user_challenge.save
      render plain: "added"
    else
    end
  end

  def destroy
    user_challenge = current_user.user_challenges.find_by_challenge_id(params[:id])
    if user_challenge
      if user_challenge.delete
        render plain: "deleted"
      end
    end
  end
end
