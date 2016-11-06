require 'rest-client'
require 'json'

class HackerRank
  def initialize(api_key, params, challenge)
    @api_key = api_key
    @url = 'http://api.hackerrank.com/checker/submission.json'
    @params = params
    @challenge = challenge
  end

  def post
    begin
      @response = RestClient.post(@url, build_args)
    rescue
      @response = 'error'
    end
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

  def parse_result(result)
    if result == 'error'
      return 'There was an error.'
    end
    test_case_outputs = @challenge.test_case_output
    s = []
    responses = JSON.parse(result.body)['result']['stdout']
    responses.each_index do |i|
      r = responses[i].strip
      if r == test_case_outputs[i]
        s << "Test Case #{i+1}: Passed!"
      else
        s << "Test Case #{i+1}: Failed."
      end
    end
    s
  end
end
