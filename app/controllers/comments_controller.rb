class CommentsController < ApplicationController
    def index
      comments = @current_person.comments
      render json: comments
    end
  
    def create
      comment = @current_person.comments.build(comment_params)
      if comment.save
        render json: comment, status: :created
      else
        render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
  