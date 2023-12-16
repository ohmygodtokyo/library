class BooksController < ApplicationController
  before_action :set_collection
  before_action :set_book, only: [:edit, :show, :update, :destroy, :download, :read, :translate]

  def index
    @books = @collection.books
  end

  def show
  end

  def new
    puts "Params: #{params.inspect}"
    @book = @collection.books.new
  end

  def create
    @book = @collection.books.new(book_params)
    @book.user_id = current_user.id

    puts "Params: #{params.inspect}"
    puts "Book valid? #{@book.valid?}"
    puts "Errors: #{@book.errors.full_messages}"

    if @book.save
      redirect_to collection_path(@collection, @book), notice: "The book was successfully created."
    else
      render :new, status: :unprocessable_entity, alert: "Something went wrong. The book could not be created. Please try again."
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to collection_path(@collection, @book), notice: "Book was successfully updated."
    else
      render :edit, status: :unprocessable_entity, alert: "Something went wrong. Book could not be updated. Please try again."
    end
  end

  def destroy
    @book.destroy
    redirect_to collection_path(@collection, @book), status: :see_other, notice: "Book was successfully deleted."
  end

  def download
    @book = @collection.books.find(params[:id])
    send_data @book.file.download, filename: @book.file.filename.to_s, type: @book.file.content_type, disposition: 'attachment'
  end

  def read
    @book = @collection.books.find(params[:id])
    send_data @book.file.download, type: @book.file.content_type, disposition: 'inline'
  end

  def translate
  end

  private

  def set_collection
    @collection = Collection.find(params[:collection_id])
  end

  def set_book
    @book = @collection.books.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :file)
  end
end
