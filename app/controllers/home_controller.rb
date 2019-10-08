class HomeController < ApplicationController
  bofore_action :forbid_login_user, {only: [:index]}

  def index
  end

  def about
  end
end
