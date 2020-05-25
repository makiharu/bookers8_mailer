class UsersController < ApplicationController
  #before_action :baria_user, only: [:edit, :update]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
  end

  def index
    @users = User.all #一覧表示するためにUserモデルのデータを全て変数に入れて取り出す。
    @book = Book.new #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
  end
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "successfully updated user!"
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end



  def correct_user
      user = User.find(params[:id])
      if current_user != user
      redirect_to user_path(current_user)
    end
  end


end


