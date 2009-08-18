class ModeratorsController < ApplicationController
  before_filter :login_required

  def destroy
    Moderatorship.delete_all ['id = ?', params[:id]]
    redirect_to user_path(params[:user_id])
  end
  
  alias authorized? admin?
end
