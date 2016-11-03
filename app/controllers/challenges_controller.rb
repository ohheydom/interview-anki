class ChallengesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_challenge, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user_to_edit, only: [:edit, :update, :destroy]

  def show
  end

  def index
    @challenges = Challenge.first(10)
  end

  def user_created_index
    @challenges = current_user.created_challenges.all
  end

  def new
    @challenge = current_user.challenges.new
  end

  def destroy
    if not @challenge.destroy
      flash[:error] = 'There was a problem deleting the challenge.'
    else
      flash[:success] = 'Challenge deleted.'
    end
    redirect_to user_created_challenges_path
  end

  def create
    title = challenge_params[:title]
    slug = title.parameterize
    @challenge = current_user.created_challenges.new({ slug: slug }.merge(challenge_params))
    if @challenge.save
      redirect_to @challenge
    else
      flash[:error] = 'There was an error.'
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    title = challenge_params[:title]
    slug = title.parameterize
    if @challenge.update({ slug: slug }.merge(challenge_params))
      redirect_to @challenge
    else
      render :edit
    end
  end

  private
  def challenge_params
    params.require(:challenge).permit(:slug, :title, :description, :boilerplate_code, :test_cases)
  end

  def authorize_user_to_edit
    if @challenge.creator != current_user
      flash[:error] = 'You cannot modify a challenge you did not create.'
      redirect_to @challenge
    end
  end

  def find_challenge
    @challenge = Challenge.find_by_id(params[:id])
    if not @challenge
      flash[:error] = 'Challenge was not found.'
      redirect_to root_path
    end
  end
end
