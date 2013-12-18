require "net/http"
require "uri"

class ImageSection < SitePrism::Section
  def broken?
    uri = URI.parse self.src
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)

    response.code != "200"
  end

  def src
    root_element['src']
  end
end

class NavbarSection < SitePrism::Section
  element  :current,  'li.current a'
  elements :links,    'li a'
end

class SlideshowSection < SitePrism::Section
  elements :thumbs,         '.thumbs a.thumb'
  element  :selected_thumb, '.thumbs a.selected_thumb'

  element  :title_link,             '.content .hl-shortd a'
  element  :shortdesc,              '.content .shortdesc'
  section  :image,    ImageSection, '.content img'

end

class HomePage < SitePrism::Page
  set_url 'http://www.liputan6.com/'
  set_url_matcher  %r(liputan6.com)

  section  :navbar, NavbarSection, 'ul#nav'
  section  :slideshow, SlideshowSection, 'div#slidebox'

  sections :subcategory_images, ImageSection, '.list2 img'
end
