class NavbarSection < SitePrism::Section

  element  :current,  'li.current a'
  elements :links,    'li a'

end

class HomePage < SitePrism::Page
  set_url 'http://www.liputan6.com/'
  set_url_matcher  %r(liputan6.com)

  section  :navbar, NavbarSection, 'ul#nav'
end
