require 'rest-client'

class HackerRank
  def initialize(api_key, params, challenge)
    @api_key = api_key
    @url = 'http://api.hackerrank.com/checker/submission.json'
    @params = params
    @challenge = challenge
  end

  def post
    RestClient.post(@url, build_args)
  end

  def build_args
    new_ps = {}
    new_ps[:source] = @params[:code] + "\n" + @challenge.boilerplate_code
    new_ps[:testcases] = format_test_cases
    new_ps[:lang] = @challenge.language
    new_ps[:api_key] = @api_key
    new_ps
  end

  def format_test_cases
    test_cases = @challenge.test_case_input.to_json
  end
end
