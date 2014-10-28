require "prawn-rails/prawn_handler"
require "prawn-rails/rails_helper"

module PrawnRails
  class Engine < Rails::Engine
    ActionView::Template.register_template_handler(:prawn, PrawnRails::PrawnHandler)
    Mime::Type.register_alias("application/pdf", :pdf) unless Mime::Type.lookup_by_extension(:pdf)
    ActionView::Base.send(:include, PrawnRails::RailsHelper)
  end
end
