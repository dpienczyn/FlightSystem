module Admins
  class SessionsController < Devise::SessionsController
    layout 'admin_application'

    def after_sign_in_path_for(resource)
      admins_flights_path
    end
  end
end
