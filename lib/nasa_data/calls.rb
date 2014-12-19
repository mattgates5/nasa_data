module NasaData
  class << self
    @api = NasaData::API.new

    # Provide a list of most recent datasets
    def get_recent_datasets(count = 10)
      @api.request('get_recent_datasets', count: 10)
    end

    def get_dataset(id, slug)
      @api.request('get_dataset', id: id, slug: slug)
    end

    def get_date_datasets(date, count = 10)
      @api.request('get_date_datasets', date: date, count: count)
    end

    def get_category_datasets(id, slug, count = 10)
      @api.request('get_category_datasets', id: id, slug: slug, count: count)
    end

    def get_tag_datasets(id, slug, count = 10)
      @api.request('get_tag_datasets', id: id, slug: slug, count: count)
    end

    def get_search_results(search, count = 10)
      @api.request('get_search_results', search: search, count: count)
    end

    def get_date_index
      @api.request('get_date_index')
    end

    def get_category_index
      @api.request('get_category_index')
    end

    def get_tag_index
      @api.request('get_tag_index')
    end
  end
end
