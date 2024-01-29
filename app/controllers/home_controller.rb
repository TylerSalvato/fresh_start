# app/controllers/home_controller.rb
class HomeController < ApplicationController
    def index
      render plain: 'Hello, World!'
    end
  end
  