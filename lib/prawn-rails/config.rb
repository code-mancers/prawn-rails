require 'ostruct'

module PrawnRails
  extend self

  @config = OpenStruct.new(:page_layout => :portrait,
                           :page_size => "A4")

  def config
    begin
      block_given? ? yield(@config) : @config
    rescue => e
      puts e
      puts e.backtrace
    end
  end
end
