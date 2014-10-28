require 'prawn-rails/document_extension'

module PrawnRails
  module RailsHelper
    def prawn_document(options={})
      ::Prawn::Document.extensions << PrawnRails::DocumentExtension
      options.reverse_merge!(:page_layout => PrawnRails.config.page_layout,
                             :page_size => PrawnRails.config.page_size)

      options.reverse_merge!(:skip_page_creation => true) if PrawnRails.config.skip_page_creation

      pdf = ::Prawn::Document.new(options)

      yield pdf if block_given?

      pdf.render
    end
  end
end
