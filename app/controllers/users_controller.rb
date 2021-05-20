class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    #@prototype = Prototype.find(params[:id])
    @prototype = Prototype.new
    @prototypes = @user.prototypes
    #@prototypes = @prototype.comments.includes(:user)
  end

end
