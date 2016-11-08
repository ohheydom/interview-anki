require 'rest-client'
require 'json'

class HackerRank
  def initialize(params)
    @url = 'http://api.hackerrank.com/checker/submission.json'
    @params = params
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
    new_ps[:source] = @params[:source]
    new_ps[:testcases] = @params[:test_case_inputs]
    new_ps[:lang] = @params[:lang]
    new_ps[:api_key] = @params[:api_key]
    new_ps
  end

  def parse_result(result)
    if result == 'error'
      return 'There was an error.'
    end
    test_case_outputs = @params[:test_case_outputs]
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
