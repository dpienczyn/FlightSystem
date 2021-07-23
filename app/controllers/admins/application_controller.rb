module Admins
  class ApplicationController < ActionController::Base
    before_action :authenticate_admin!

    layout 'admin_application'

  end
end
