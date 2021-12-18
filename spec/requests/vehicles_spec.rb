require 'swagger_helper'

RSpec.describe 'vehicles', type: :request do

  path '/vehicles.json' do

    get('list vehicles') do
      tags 'Vehicles'
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

    post('create vehicle') do
      tags 'Vehicles'
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

  path '/vehicles/{id}.json' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show vehicle') do
      tags 'Vehicles'
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

    put('update vehicle') do
      tags 'Vehicles'
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

    delete('delete vehicle') do
      tags 'Vehicles'
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

  path '/vehicles/{id}/send_to_route.json' do
    parameter name: 'id', in: :path, type: :string, description: 'id'
    post('send to route') do
      tags 'Vehicles'
      consumes 'application/json'
      parameter name: :vehicle, in: :body, schema: {
        type: :object,
        properties: {
          route_id: { type: :integer }
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
  end

  path '/vehicles/{id}/finish_route.json' do
    parameter name: 'id', in: :path, type: :string, description: 'Vehicle id'
    post('send to route') do
      tags 'Vehicles'
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
