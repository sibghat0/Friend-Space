class DocumentsController < ApplicationController
  def index
    @documents = Document.where(["name LIKE ?", "%#{params[:search]}%"])
    @documents = Document.all.order("created_at DESC")
  end

  def show
    @document = Document.find(params[:id])
  end

  def new
    @document = Document.new
  end

  def edit
    @document = Document.find(params[:id])
  end

  def create
    @document = Document.new(document_params)
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
    pdf = Prawn::Document.new(:page_size => [800, 800], :top_margin => 0, :bottom_margin => 0, :left_margin => 0)
    thumbnail_image = StringIO.open(@document.images.download)
    pdf.image thumbnail_image, fit:[800, 800]
    send_data(pdf.render,
    filename: "#{@document.name}.pdf",
    type: 'application/pdf',
    )
  end

  private

    def document_params
      params.require(:document).permit(:name, :images)
    end
end
