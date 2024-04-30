
class Api::V1::PdfsController < ApiController

  def index
    pdf=Pdf.all
    render json: pdf
  end
end
