class PostCommentsController < ApplicationController
  def index
  end

  def new

    # @post=Post.find_by_id(params[:format])
    # @post_owner=User.find_by_id(@post.users.ids.first)
    # @commenter=current_user
    # @post_comment=@post.post_comment.build

  end



  def create


    @post=Post.find(params[:post_comment][:post_id])
    # @post_owner=User.find_by_id(@post.user)
    # @commenter=current_user

    @post_comment= current_user.post_comments.build(post_comment_params)
    # @commenter.post_comments << @post_comment
    if @post_comment.valid?

      @post_comment.save
      @user=@post.user

      redirect_to user_post_comment_path(current_user, @post_comment)
    else
      flash[:error]="Display Name and Your Comment can't be blank"
      redirect_to user_post_path(current_user,@post)
    end
  end

  def show

    @commenter= current_user
    @comment= PostComment.find(params[:id])
    @post=@comment.post



  end

  def edit

    @comment= PostComment.find_by_id(params[:id])
    @comment_owner= @comment.user

  end

  def update

    @comment= PostComment.find(params[:id])

    @updated_username=params[:post_comment][:username]
    @updated_body=params[:post_comment][:body]
    if @comment.update(:username=> @updated_username, :body=>@updated_body)


      redirect_to user_posts_path(@comment.user)
    else
      render :edit
    end
  end

  def destroy

    @comment=PostComment.find(params[:id])
    @comment_owner=@comment.user
    @comment_post=@comment.post
    @comment.delete
    redirect_to user_posts_path(@comment_owner,@comment_post)

  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:username, :body, :post_id)
  end
end
