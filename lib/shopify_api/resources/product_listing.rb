module ShopifyAPI
  class ProductListing < Base
    init_prefix :application

    def self.product_ids(options = {})
      get(:product_ids, application_id: options.fetch(:application_id), page: options.fetch(:page, 1))
    end
  end
end
