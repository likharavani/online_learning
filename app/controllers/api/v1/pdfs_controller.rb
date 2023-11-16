class PdfsController < ApplicationController

  def index
    pdf=Pdf.all
    render json: pdf
  end
end
