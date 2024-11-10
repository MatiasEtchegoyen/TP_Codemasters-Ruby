class SessionsController < ApplicationController
  layout "login", only: [ :new ]
  def new
    # Aquí puedes añadir la lógica que necesites para el login
  end

  def create
    valid_mail = "usuario@ejemplo.com"
    valid_pass = "1234"
    if params[:email] == valid_mail && params[:password] == valid_pass
      flash[:notice] = "bienvenido, #{valid_mail}! "
      redirect_to "/new"
    else
      flash[:alert] = "Usuario no reconocido"
      redirect_to "/"
    end
    # Aquí puedes añadir la lógica para autenticar al usuario
  end

  # def destroy
  #   # Aquí puedes añadir la lógica para cerrar sesión
  # end
end
