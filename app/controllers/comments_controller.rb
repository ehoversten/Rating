class CommentsController < ApplicationController
  before_action :find_project
  before_action :find_comment, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
  end


  def create
    @comment = Comment.new(comment_params)
    @comment.project_id = @project.id
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to project_path(@project)
  end



  private

  def comment_params
    params.require(:comment).permit([:rating, :commenter, :comment])
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

end
