require 'test_helper'
require "prawn-rails/document_extension"

class PrawnRailsTest < ActiveSupport::TestCase
  include  PrawnRails::DocumentExtension
  test "html_strip" do
    
    assert_nil(html_strip(nil)) 
    assert_not_nil(html_strip(""))
  end
end
