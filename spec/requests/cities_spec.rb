require 'swagger_helper'

RSpec.describe 'cities', type: :request do

  path '/cities.json' do

    get('list cities') do
      tags 'Cities'
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

    post('create city') do
      tags 'Cities'
      consumes 'application/json'
      parameter name: :city, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: [ 'title', 'content' ]
      }

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

  path '/cities/{id}.json' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show city') do
      tags 'Cities'
      response(200, 'successful') do
        let(:id) { '123' }

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

    put('update city') do
      tags 'Cities'
      parameter name: :city, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: [ 'title', 'content' ]
      }
      response(200, 'successful') do
        let(:id) { '123' }

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

    delete('delete city') do
      tags 'Cities'
      response(200, 'successful') do
        let(:id) { '123' }

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
