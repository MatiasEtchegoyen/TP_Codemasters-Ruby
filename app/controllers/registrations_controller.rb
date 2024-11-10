class RegistrationsController < ApplicationController
  layout "registro", only: [ :new ]
  def new
  end
end
