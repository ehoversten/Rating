class UsersController < ApplicationController

  def show
  end

  def update
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:user).permit(:email, :avatar)
    end

end
