module ShopifyAPI
  class ProductListing < Base
    class Image < Base
      # generate a method for each possible image variant
      [:pico, :icon, :thumb, :small, :compact, :medium, :large, :grande, :original].each do |m|
        reg_exp_match = "/\\1_#{m}.\\2"
        define_method(m) { src.gsub(/\/(.*)\.(\w{2,4})/, reg_exp_match) }
      end
    end

    class Variant < Base
    end

    class Option < Base
    end

    init_prefix :application

    has_many :variants, class_name: 'ShopifyAPI::ProductListing::Variant'
    has_many :images, class_name: 'ShopifyAPI::ProductListing::Image'
    has_many :options, class_name: 'ShopifyAPI::ProductListing::Option'

    def self.product_ids(options = {})
      get(:product_ids, application_id: options.fetch(:application_id), page: options.fetch(:page, 1))
    end
  end
end
