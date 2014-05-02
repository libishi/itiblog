class CommentsController < ApplicationController
   def create
    @post = Post.find(params[:post_id])
    @comment=Comment.new(comment_params)
    @comment.post=@post
    @comment.owner=current_user.id
    @comment.save
    redirect_to post_path(@post)
  end
 def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
  def update
     @post = Post.find(params[:post_id])
     @comment=Comment.find(params[:id])
     report=@comment.report+1
     @comment.update_attributes(:report => report)
     if @comment.report >= 10
      destroy
      else
          redirect_to post_path(@post)
       end   
        
    end 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
    def comment_body
     @comment=Comment.find(params[:id])
    end
end
