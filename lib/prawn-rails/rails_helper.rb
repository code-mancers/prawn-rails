require 'prawn-rails/document_extension'

module PrawnRails
  module RailsHelper
    def prawn_document(options={})
      Prawn::Document.extensions << PrawnRails::DocumentExtension
      options.reverse_merge!(:page_layout => PrawnRails.config.page_layout,
                             :page_size => PrawnRails.config.page_size)

      pdf = Prawn::Document.new(options)

      yield pdf if block_given?

      pdf.render
    end
  end
end
