class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :edit, :update, :destroy]
  helper_method :collection_image_url

  def index
    @collections = Collection.all
  end

  def show
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = current_user.collections.new(collection_params)

    if @collection.save
      redirect_to collection_path(@collection), notice: "The collection was successfully created."
    else
      render :new, status: :unprocessable_entity, alert: "Something went wrong. The collection could not be created. Please try again."
    end
  end

  def edit
  end

  def update
    if @collection.update(collection_params)
      redirect_to collection_path(@collection), notice: "Collection was successfully updated."
    else
      render :edit, status: :unprocessable_entity, alert: "Something went wrong. Collection could not be updated. Please try again."
    end
  end

  def destroy
    @collection.destroy
    redirect_to collections_path, status: :see_other, notice: "Collection was successfully deleted."
  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:name, :image)
  end
end
