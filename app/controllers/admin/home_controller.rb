class Admin::HomeController < ApplicationController
  def index
    session_check('index')
  end
end
