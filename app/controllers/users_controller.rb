class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def new
  end

  def show

    @user=User.find(params[:id])
    @users=User.all
    @profile_owner=@user
    @user_posts=@user.posts

    @views= @user.view

    if @user != current_user
      @updated_views=@views+1
      @user.update(:view=>@updated_views)
    else
      @views=@views
    end

  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def famous_user
    @famous_user_ar_relation = User.famous_users
    @famous_user=User.find_by_id(@famous_user_ar_relation.first.id)
    @views=@famous_user.view

  end

  private

  def user_params

  end

end
