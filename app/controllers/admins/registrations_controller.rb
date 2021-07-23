module Admins
  class RegistrationsController < Devise::RegistrationsController
    layout 'admin_application'

    def after_sign_up_path_for(resource)
      admins_flights_path
    end
  end
end
