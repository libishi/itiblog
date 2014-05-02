class PostsController < ApplicationController
  def index
    @post=Post.where("owner" => current_user) 
  end
  def new
    @post= Post.new
  end
  def show
  	@post=Post.find(params[:id])

  end
  def edit
    @post=Post.find(params[:id])
  end
  def create
  		@post = Post.new(post_params)
  		@post.owner = current_user.id
  		if @post.save
  		  redirect_to @post
      else
        render 'new'  
      end
  end  
  def update
     @post=Post.find(params[:id])
       if @post.update(post_params)
        redirect_to @post
      else
          render 'edit'
       end   
        
    end 
    def destroy
       @post=Post.find(params[:id])
       if @post.destroy
           redirect_to posts_path
       else
          render @post
          end   

     end 
  	private
  	def post_params
  		params.require(:post).permit(:title,:body)
  end
end
