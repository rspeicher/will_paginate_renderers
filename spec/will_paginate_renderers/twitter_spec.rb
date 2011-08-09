require 'spec_helper'

module WillPaginateRenderers
  describe Twitter do
    before do
      @renderer = Twitter.new
    end

    it "should raise error when unprepared" do
      expect { @renderer.send :param_name }.to raise_error
    end

    it "should prepare with collection and options" do
      prepare({}, :param_name => 'mypage')
      @renderer.send(:current_page).should eql(1)
      @renderer.send(:param_name).should eql('mypage')
    end

    it "should have pagination definition" do
      prepare({ :total_pages => 1 }, :page_links => true)
      @renderer.pagination.should eql([:next_page])
    end

    it "should be empty when no more pages" do
      prepare(:total_pages => 1)
      @renderer.to_html.should eql("")
    end

    it "should use the :twitter_label option" do
      WillPaginateRenderers.pagination_options[:twitter_label] = 'Custom Label'
      prepare :total_pages => 2
      @renderer.expects(:url).returns('')
      @renderer.to_html.should match(/Custom Label/)
    end

    it "should use the :twitter_class option" do
      WillPaginateRenderers.pagination_options[:twitter_class] = 'custom_class'
      prepare :total_pages => 2
      @renderer.expects(:url).returns('')
      @renderer.to_html.should match(/custom_class/)
    end

    protected

    def prepare(collection_options, options = {})
      @renderer.prepare(collection(collection_options), options, '')
    end
  end
end
