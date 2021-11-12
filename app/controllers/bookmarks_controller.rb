class BookmarksController < ApplicationController
  before_action :find_list, only: [:new, :create]
  # def index
  #   @bookmarks = Bookmark.all
  # end

  # As a user, I can view the details of a bookmark
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  # As a user, I can add a new bookmark
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  # # As a user, I can edit a task (mark as completed / update title & details)
  # def edit
  #   @task = Task.find(params[:id])
  # end

  # def update
  #   @task.update(task_params)
  #   redirect_to task_path(@task)
  # end

  # As a user, I can remove a bookmark
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  # private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end

  def find_list
    @list = List.find(params[:list_id])
  end

  def find_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
