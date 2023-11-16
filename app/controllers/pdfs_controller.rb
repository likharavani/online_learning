# frozen_string_literal: true

# app/controllers/pdfs_controller.rb
class PdfsController < ApplicationController
  def index
    @pdf = Pdf.all
  end
end
