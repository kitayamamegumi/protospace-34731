class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save  
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
    if @prototype.user.id == current_user.id
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    @prototype = Prototype.find(params[:id])
    #prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
       #prototype.update(prototype_params)
      redirect_to prototype_path
    else
      render :edit
      #redirect_to edit_prototype_path
      #(#の緑はupdateの処理が@prototypeではないので、一度redirect_toでコントローラーのeditの＠prototypeを読まないと編集画面に前のデータが残らないので消えてしまう)
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :consept, :image).merge(user_id: current_user.id)
  end

end
