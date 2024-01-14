class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
    def index
        @posts = Post.all
        if params[:tag_ids]
          @posts = []
          params[:tag_ids].each do |key, value|
            if value == "1"
              tag_posts = Tag.find_by(name: key).posts
              @posts = @posts.empty? ? tag_posts : @posts & tag_posts
            end
          end
        end
    end
    
    
    def new
        @post = Post.new
      end
    
      def create
        post = Post.new(post_params)
        post.user_id = current_user.id
        if post.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

     
    
      private
      def post_params
        params.require(:post).permit(:name, :comment, :user_name, :image, tag_ids: [])
      end

     
end
