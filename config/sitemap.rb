# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.psara-institute.com"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  add 'static_pages/logo'
  add 'static_pages/jobs'
  add 'static_pages/home'
  add 'static_pages/message'
  add 'inquiry'

  Post.find_each do |post|
    add post_path(product), :lastmod => product.updated_at
  end

  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
