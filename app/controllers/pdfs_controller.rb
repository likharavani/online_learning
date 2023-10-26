class PdfsController < ApplicationController
  def index
    @pdf=Pdf.all
  end
end
