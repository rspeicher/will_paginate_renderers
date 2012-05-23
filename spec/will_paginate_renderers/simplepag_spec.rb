require 'spec_helper'

module WillPaginateRenderers
  describe SimplePag do
    before do
      @renderer = SimplePag.new
      @renderer.stubs(:url).returns('')
    end

    it "should raise error when unprepared" do
      expect { @renderer.send :param_name }.to raise_error
    end

    it "should prepare with collection and options" do
      prepare({}, :param_name => 'mypage')
      @renderer.send(:current_page).should eql(1)
      @renderer.send(:param_name).should eql('mypage')
    end

    it "should have total_pages accessor" do
      prepare :total_pages => 42
      expect { @renderer.send(:total_pages).should eql(42) }.to_not have_deprecation
    end

    it "should have pagination definition" do
      prepare({ :total_pages => 1 }, :page_links => true)
      @renderer.pagination.should eql([:newer, :older])
    end

    it "should not have 'newer', but should have 'older' when on page 1" do
      prepare({:total_pages => 10, :page => 1})

      html = @renderer.to_html
      html.should_not match(/Newer/)
      html.should match(/Older/)
     end

    it "should have 'newer' and 'older' when on page 2" do
      prepare({:total_pages => 10, :page => 2})

      html = @renderer.to_html
      html.should match(/Newer/)
      html.should match(/Older/)
    end

    it "should not have 'older' when on the last page" do
      prepare({:total_pages => 10, :page => 10})

      html = @renderer.to_html
      html.should match(/Newer/)
      html.should_not match(/Older/)
    end

    context "options" do
      before do
        prepare({:per_page => 100, :total_entries => 895, :page => 5})

        %w(newer older).each do |name|
          WillPaginateRenderers.pagination_options[:"simplepag_#{name}_label"] = "custom_#{name}_label"
          WillPaginateRenderers.pagination_options[:"simplepag_#{name}_class"] = "custom_#{name}_class"
        end
      end

      subject { @renderer.to_html }

      it { should match(/custom_newer_label/) }
      it { should match(/custom_older_label/) }
      it { should match(/custom_newer_class/) }
      it { should match(/custom_older_class/) }
    end

    protected

    def prepare(collection_options, options = {})
      @renderer.prepare(collection(collection_options), options, '')
    end
  end
end
