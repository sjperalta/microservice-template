# spec/api/swagger_helper.rb
require 'rspec/swagger'

RSpec.configure do |config|
  config.swagger_root = Rails.root.to_s + '/swagger'
  config.swagger_docs = {
    'v1/swagger.json' => {
      openapi: '3.0.0',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {}
    }
  }
end

Rspec::Swagger.configure do |config|
    config.swagger_root = Rails.root.to_s + '/swagger'
    config.swagger_docs = {
      'v1/swagger.json' => {
        swagger: '2.0',
        info: {
          title: 'API V1',
          version: 'v1'
        },
        paths: {
          '/api/v1/users' => {
            get: {
              summary: 'Obtiene una lista de usuarios',
              responses: {
                '200' => {
                  description: 'Lista de usuarios obtenida con éxito'
                },
                '500' => {
                  description: 'Error en el servidor'
                }
              }
            }
          },
          # ... otras definiciones de endpoints
        }
      }
    }
  end