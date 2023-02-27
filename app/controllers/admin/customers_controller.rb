class Admin::CustomersController < ApplicationController
  def index
    @customer=Customer.all
  end

  def edit
  end

  def show
  end
end


