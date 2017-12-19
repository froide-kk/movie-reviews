class TagsController < ApplicationController
  before_action :set_tag, only: %i[show edit update destroy]

  def index
    @tags = Tag.all
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def edit
  end

  def create
    @tag = Tag.new(tag_params)

    render :new and return unless @tag.save
    redirect_to @tag, notice: 'Tag was successfully created.'
  end

  def update
    render :edit and return unless @tag.update(tag_params)
    redirect_to @tag, notice: 'Tag was successfully updated.'
  end

  def destroy
    @tag.destroy
    redirect_to tags_url, notice: 'Tag was successfully destroyed.'
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
