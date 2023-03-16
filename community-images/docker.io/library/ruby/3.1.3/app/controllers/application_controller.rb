class ApplicationController < ActionController::API
    def helloWorld
      render json: { name: 'Hello World' }
    end
  end
  
