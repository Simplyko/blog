class CommentsController < ApplicationController
    before_action :authenticate_user!, only: [:create]

	def new
		@article = Article.find(params[:article_id])
		@comment = @article.comments.new
	end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)

		if @comment.save
    	redirect_to article_path(@article)
		else
			render :new
		end
  end  
	
	def edit
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
	end

	def update
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])

		if @comment.update(comment_params)
			redirect_to article_path(@article)
		else
			render :edit
		end
	end

    def destroy
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      @comment.destroy

      redirect_to article_path(@article)
    end
    
    private

    def comment_params
        params.require(:comment).permit(:author, :body)
    end
end
