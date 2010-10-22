$:.unshift(File.expand_path('../../lib', __FILE__))

require 'will_paginate_renderers'

require 'will_paginate/collection'
require 'will_paginate/view_helpers/base'

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

  def have_deprecation
    DeprecationMatcher.new
  end
end

# Copied from will_paginate's spec_helper
class DeprecationMatcher
  def initialize
    @old_behavior = WillPaginate::Deprecation.behavior
    @messages = []
    WillPaginate::Deprecation.behavior = lambda { |message, callstack|
      @messages << message
    }
  end

  def matches?(block)
    block.call
    !@messages.empty?
  ensure
    WillPaginate::Deprecation.behavior = @old_behavior
  end

  def failure_message
    "expected block to raise a deprecation warning"
  end

  def negative_failure_message
    "expected block not to raise deprecation warnings, #{@messages.size} raised"
  end
end

RSpec.configure do |c|
  c.mock_with :mocha

  c.include(WillPaginate::ViewHelpers::Base)
  c.include(MyExtras)
end
