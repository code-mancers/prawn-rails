module PrawnRails
  class PrawnHandler 
    
    def self.call(template)
      require 'prawn-rails/prawn_rails_helper'
      ::Prawn::Document.extensions << PrawnRailsHelper
      self.new.call(template)
    end
    
    def call(template)
      "pdf = ::Prawn::Document.new(:skip_page_creation => true, :page_size => #{page_size}, :page_layout => #{page_layout});" +
      template.source +
      ";self.output_buffer=pdf.render;"
    end

    private

    def page_size
      PrawnRails.config.page_size
    end

    def page_layout
      PrawnRails.config.page_layout
    end
  end
end
