class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create   
    if User.count > 2
      redirect_to new_user_session_path, notice: " - Sorry. Users' Limit has been reached."
    end
  end

  def update
    super
  end
end


