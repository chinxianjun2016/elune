class HomesController < ApplicationController
  before_action :authenticate_user!
  layout  "home"

  def dashboard
  end
end
