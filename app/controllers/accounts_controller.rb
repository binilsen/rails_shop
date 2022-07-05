class AccountsController < ApplicationController
  def index
    @user = User.first
  end
end
