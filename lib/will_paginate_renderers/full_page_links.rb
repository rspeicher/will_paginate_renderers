module WillPaginateRenderers
  # = Full page links
  # 
  # == What this?
  #   This render is make for SEO friendly, speed up Search Engine spider to get all pages of list.
  #   The pagination style is same as will_paginate base style, but this will add other page links as hidden.
  #   So the spider will find out the all pages of list.
  #
  # == Why?
  #   Google your can submit a sitemap to WebmasterTools, but the other Search Engine (e.g. Baidu, Sogou etc.) 
  #   are not support XML sitemap, so if your wan't theme quickly to grab your all pages, you need tell the 
  #   all of you page links.
  #
  class FullPageLinks < WillPaginate::ViewHelpers::LinkRenderer
    def to_html
      numbers = @options[:page_links] ? windowed_page_numbers : []
      
      links = []
      numbers.each do |number|
        links << (number.is_a?(Fixnum) ? page_number(number) : send(number))
      end
      
      links.unshift previous_page
  
      links.push next_page
      links.push "<div class=\"other_links\" style='display:none'>"
      links.push hide_windowed_links
      links.push "</div>" 
      html = links.join(@options[:separator])
  
      @options[:container] ? html_container(html) : html
    end
  
    protected
    def hide_windowed_links
      prev = nil
      hide_page_numbers.to_a.inject [] do |links, n|        
        links << page_number(n)
        prev = n
        links
      end
    end

    def hide_page_numbers
      (1..total_pages).to_a - windowed_page_numbers
    end
  end
end