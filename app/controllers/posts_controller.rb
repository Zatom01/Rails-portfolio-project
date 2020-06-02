class PostsController < ApplicationController

  def index

    @user=User.find(params[:user_id])
    @posts=@user.posts.all

  end

  def new
    @user=User.find(params[:user_id])
  end

  def create

    @user=User.find(params[:user_id])
    @post=@user.posts.create(post_params)
    if !@post.content.nil?
      @post.save
    else
      render :new
    end

    redirect_to user_post_path(@user, @post)

  end

  def show

    @user=User.find(params[:user_id])
    @post=Post.find(params[:id])
    @user_posts=@user.posts
    @post_owner=@user



  end

  def edit
    @post=Post.find(params[:id])
    @user=User.find(params[:user_id])
  end

  def update
    @user=User.find(params[:user_id])
    @post=Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_post_path(@user,@post)
    else
      render :edit
    end
  end

  def destroy

    @post=Post.find(params[:id])
    @user=User.find(params[:user_id])
    @post.destroy

    redirect_to user_posts_path(@user)
  end

  def all
    @all_posts=Post.all
    @all_users=User.all
    @all_users_count=User.all.count
    render :all
  end

  private
  def post_params
    params.require(:post).permit([:content])
  end

end
