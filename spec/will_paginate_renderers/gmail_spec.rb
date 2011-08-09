require 'spec_helper'

module WillPaginateRenderers
  describe Gmail do
    before do
      @renderer = Gmail.new
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

    it "should have pagination definition" do
      prepare({ :total_pages => 1 }, :page_links => true)
      @renderer.pagination.should eql([:newest, :newer, :window, :older, :oldest])
    end

    it "should be empty when no more pages" do
      prepare(:total_pages => 1)
      @renderer.stubs(:window).returns('')
      @renderer.to_html.should eql("")
    end

    it "should not have 'newest' or 'newer', but should have 'older' and 'oldest' when on page 1" do
      prepare({:total_pages => 10, :page => 1})

      html = @renderer.to_html
      html.should_not match(/Newer/)
      html.should_not match(/Newest/)
      html.should match(/Older/)
      html.should match(/Oldest/)
    end

    it "should have 'newer', 'older' and 'oldest' but not 'newest' when on page 2" do
      prepare({:total_pages => 10, :page => 2})

      html = @renderer.to_html
      html.should match(/Newer/)
      html.should_not match(/Newest/)
      html.should match(/Older/)
      html.should match(/Oldest/)
    end

    it "should not have 'older' or 'oldest' when on the last page" do
      prepare({:total_pages => 10, :page => 10})

      html = @renderer.to_html
      html.should match(/Newest/)
      html.should match(/Newer/)
      html.should_not match(/Older/)
      html.should_not match(/Oldest/)
    end

    it "should have 'older' but not 'oldest' when on second to last page" do
      prepare({:total_pages => 10, :page => 9})

      html = @renderer.to_html
      html.should match(/Newest/)
      html.should match(/Newer/)
      html.should match(/Older/)
      html.should_not match(/Oldest/)
    end

    it "should have the correct window text when on page 1" do
      prepare({:per_page => 100, :total_entries => 895, :page => 1})
      @renderer.to_html.should match(/1 - 100 of 895/)
    end

    it "should have the correct window text on page 2" do
      prepare({:per_page => 100, :total_entries => 895, :page => 2})
      @renderer.to_html.should match(/101 - 200 of 895/)
    end

    it "should have the correct window text on the last page" do
      prepare({:per_page => 100, :total_entries => 895, :page => 9})
      @renderer.to_html.should match(/801 - 895 of 895/)
    end

    context "options" do
      before do
        prepare({:per_page => 100, :total_entries => 895, :page => 5})

        %w(newest newer older oldest).each do |name|
          WillPaginateRenderers.pagination_options[:"gmail_#{name}_label"] = "custom_#{name}_label"
          WillPaginateRenderers.pagination_options[:"gmail_#{name}_class"] = "custom_#{name}_class"
        end
      end

      subject { @renderer.to_html }

      it { should match(/custom_newest_label/) }
      it { should match(/custom_newer_label/) }
      it { should match(/custom_older_label/) }
      it { should match(/custom_oldest_label/) }
      it { should match(/custom_newest_class/) }
      it { should match(/custom_newer_class/) }
      it { should match(/custom_older_class/) }
      it { should match(/custom_oldest_class/) }
    end

    protected

    def prepare(collection_options, options = {})
      @renderer.prepare(collection(collection_options), options, '')
    end
  end
end
