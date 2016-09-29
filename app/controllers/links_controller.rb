class LinksController < ApplicationController
  before_filter :authenticate_user!, except: [ :index, :show]
  def index
    @links = Link.all
  end

  def new
    @link = current_user.links.build
  end

  def create
    @link = current_user.links.build(link_params)

    if @link.save
      flash[:notice] = 'Link has been created.'
      redirect_to @link
    else
      flash.now[:alert] = 'Link has not been created.'
      render 'new'
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])

    if @link.update(link_params)
      flash[:notice] = 'Link has been updated.'
      redirect_to @link
    else
      flash.now[:alert] = 'Link has not been updated.'
      render 'edit'
    end
  end

  def destroy
    @link = Link.find(params[:id])

    @link.destroy
    flash[:notice] = 'Link has been deleted.'
    redirect_to root_path
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
