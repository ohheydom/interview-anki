class ChallengesController < ApplicationController
  before_action :authenticate_user!
  def show
    @challenge = Challenge.find(params[:id])
  end

  def index
    @challenges = Challenge.first(10)
  end

  def new
    @challenge = current_user.challenges.new
  end

  def create
    title = challenge_params[:title]
    @challenge = current_user.challenges.new({ slug: title.parameterize}.merge(challenge_params))
    if @challenge.save
      redirect_to @challenge
    else
      render plain: challenge_params.inspect
    end

  end

  def edit
    @challenge = Challenge.find(params[:id])
  end

  def update
    @challenge = Challenge.find(params[:id])
    title = challenge_params[:title]
    slug = title
    challenge_params[:slug] = slug
    if @challenge.update(challenge_params)
      redirect_to @challenge
    else
      render edit_challenge_path(params[:id])
    end
  end

  private
  def challenge_params
    params.require(:challenge).permit(:slug, :title, :description, :boilerplate_code, :test_cases)
  end
end
