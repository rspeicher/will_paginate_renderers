$:.unshift(File.expand_path('../../lib', __FILE__))

# Fake ActionView so we can extend WillPaginate::ActionView::LinkRenderer
module ActionView
  class Base
  end
end

require 'will_paginate_renderers'
require 'will_paginate/collection'

# Copied from will_paginate's spec_helper
module MyExtras
  protected

  def collection(params = {})
    if params[:total_pages]
      params[:per_page] = 1
      params[:total_entries] = params[:total_pages]
    end
    WillPaginate::Collection.new(params[:page] || 1, params[:per_page] || 30, params[:total_entries])
  end
end

RSpec.configure do |c|
  c.mock_with :mocha

  c.include(MyExtras)
end
