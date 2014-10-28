module PrawnRails
  class PrawnHandler
    def self.call(template)
      template.source.strip
    end
  end
end
