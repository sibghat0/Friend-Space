class DocumentsController < ApplicationController
  def index
    @documents = Document.where(["name LIKE ?", "%#{params[:search]}%"]).order("created_at DESC")
  end

  def show
    @document = Document.find(params[:id])
  end

  def new
    @document = current_user.documents.build 
  end

  def edit
    @document = Document.find(params[:id])
  end

  def create
    @document = current_user.documents.build(document_params)
    if @document.save
      redirect_to documents_url(@document)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @document = Document.find(params[:id])
      if @document.update(document_params)
        redirect_to document_url(@document)
      else
        render :edit, status: :unprocessable_entity 
      end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy

     redirect_to documents_url
  end

  
  def pdf
    @document = Document.find(params[:id])
    # Down.download(@document.images)
    # pdf = Prawn::Document.new(:page_size => [800, 800], :top_margin => 0, :bottom_margin => 0, :left_margin => 0)
    # thumbnail_image = StringIO.open(@document.images.download)
    # pdf.image thumbnail_image, fit:[800, 800]
    send_data(@document.images.download,
    filename: "#{@document.name}.jpeg",
    type: 'image/jpeg',
    )
  end

  private

    def document_params
      params.require(:document).permit(:name, :images)
    end
end
