require 'swagger_helper'

RSpec.describe 'api/greetings', type: :request do
  path '/api/greetings' do
    get('list greetings') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
