require 'swagger_helper'

RSpec.describe 'routes', type: :request do

  path '/routes.json' do

    get('list routes') do
      tags 'Routes'
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

    post('create route') do
      tags 'Routes'
      consumes 'application/json'
      parameter name: :vehicle, in: :body, schema: {
        type: :object,
        properties: {
          identifier: { type: :string },
          fuel_consumption: { type: :float },
          is_available: { type: :boolean },
          city_id: { type: :integer }
        },
        required: [ 'identifier', 'fuel_consumption', 'is_available', 'city_id' ]
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

  path '/routes/{id}.json' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show route') do
      tags 'Routes'
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

    put('update route') do
      tags 'Routes'
      consumes 'application/json'
      parameter name: :vehicle, in: :body, schema: {
        type: :object,
        properties: {
          identifier: { type: :string },
          fuel_consumption: { type: :float },
          is_available: { type: :boolean },
          city_id: { type: :integer }
        },
        required: [ 'identifier', 'fuel_consumption', 'is_available', 'city_id' ]
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

    delete('delete route') do
      tags 'Routes'
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
