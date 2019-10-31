class ElasticsearchService

  def initialize model
    @model = model
  end

  def search_without_paginate query, sort=nil, page = 1, per_page = 10, is_highlight = false
    _query = query.is_a?(Hash) ? hash_query(query) : multi_match_query(query)
    _highlight = is_highlight ? fetch_highlight_hash : {}
    _sort = sort.nil? ? {id: :desc} : sort
    begin
      response = @model.search query: _query,
                               highlight: { fields: _highlight },
                               sort: _sort,
                               from: per_page * (page - 1),
                               size: 1000 #TODO

      return response.results
    rescue => e
      $logger.info("es search_without_paginate error", e)
      return []
    end
  end

  def search query, sort=nil, page = 1, per_page = 10, is_highlight = false
    _query = query.is_a?(Hash) ? hash_query(query) : multi_match_query(query)
    _highlight = is_highlight ? fetch_highlight_hash : {}
    _sort = sort.nil? ? {id: :desc} : sort
    begin
      response = @model.search query: _query,
                               highlight: { fields: _highlight },
                               sort: _sort,
                               from: per_page * (page - 1),
                               size: per_page
      return [response.response['hits']['total'], response.results]
    rescue => e
      $logger.info("es search error", e)
      struct = Struct.new :results
      return [0, struct.new([])]
    end
  end

  private

  def hash_query query
    filtered = {
      bool: {
        must: query[:filter].select{|key, value| !value.include?(' OR ')}.keys.map do |key|
          { match: query[:filter].slice(key) }
        end
      }
    }
    if query[:filter].select{|key, value| value.include?(' OR ')}.present?
      should = query[:filter].select{|key, value| value.include?(' OR ')}.map do |key, values|
        values.split(" OR ").map do |value|
          {match: {key.to_sym => value} }
        end
      end.flatten
      filtered[:bool][:must] << { bool: { should: [should] } }
    end
    filtered[:bool].merge!({filter: { range: query[:range] }}) if query[:range].present?
    filtered[:bool].merge!({must_not: { term: {status: 'preparing'} }}) if query[:only_show]
    return filtered
  end

  def multi_match_query query
    fileds = fetch_multi_match_fields
    {
      bool: {
        must: {
          multi_match:{
            query: query,
            type: "best_fields",
            fields: fileds,
            operator: "and"
          }
        },
        # filter: filter_term,
        must_not: must_not_term
      }
    }
  end

  def filter_term
    case @model.to_s
    when 'Product'
      {
        not:{
          filter:{
            term: {status: 'selling'}
          }
        }
      }
    end
  end

  def must_not_term
    case @model.to_s
    when 'Product'
      {
        term: {status: 'preparing'}
      }
    end
  end


  def fetch_multi_match_fields
    case @model.to_s
    when 'Model'
      return [
        'name_cn^7', "name_cn.ik^6", "name_cn.pinyin^5", "name_cn.standard^4", "name_cn.english^3"
      ]
    end
  end

  def fetch_highlight_hash
    case @model.to_s
    when 'Model'
      return {
        name_cn: {}, "name_cn.ik"=>{}, "name_cn.pinyin"=>{}, "name_cn.standard"=>{}, "name_cn.english"=>{}
      }
    end
  end

end