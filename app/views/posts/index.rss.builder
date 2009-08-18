xml.instruct! :xml, :version => "1.0", :encoding => "UTF-8"

xml.rss "version" => "2.0",
  'xmlns:opensearch' => "http://a9.com/-/spec/opensearch/1.1/",
  'xmlns:atom'       => "http://www.w3.org/2005/Atom" do
  xml.channel do
    xml.title "{search_posts_title} | Beast"[:posts_feed_title, search_posts_title]
    xml.link "http://#{request.host_with_port}#{search_posts_path}"
    xml.language "en-us"[:feed_language]
    xml.ttl "60"
    xml.tag! "atom:link", :rel => 'search', :type => 'application/opensearchdescription+xml', :href => "http://#{request.host_with_port+request.relative_url_root}/open_search.xml"
    unless params[:q].blank?
    	xml.tag! "opensearch:totalResults", @posts.total_entries
    	xml.tag! "opensearch:startIndex", (((params[:page] || 1).to_i - 1) * @posts.per_page)
    	xml.tag! "opensearch:itemsPerPage", @posts.per_page
      xml.tag! "opensearch:Query", :role => 'request', :searchTerms => params[:q], :startPage => (params[:page] || 1)
    end
    render :partial => "layouts/post", :collection => @posts, :locals => {:xm => xml}
  end
end
