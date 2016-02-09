module ShopifyAPI
  class CollectionListing < Base
    init_prefix :application

    def product_ids(page: 1)
      get(:product_id, params: { page: page })
    end
  end
end
