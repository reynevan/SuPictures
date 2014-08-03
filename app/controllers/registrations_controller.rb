class RegistrationsController < Devise::RegistrationsController
  def new
    flash[:info] = 'Registrations are not open yet, but please check back soon'
    redirect_to photos_path
  end

  def create
    flash[:info] = 'Registrations are not open yet, but please check back soon'
    redirect_to photos_path
  end
end