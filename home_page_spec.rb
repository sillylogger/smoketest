require_relative './spec_helper'
require 'logger'

feature 'the liputan6 homepage', js: true do

  let(:log) do
    logger = Logger.new(STDOUT)
    logger.level = Logger::DEBUG
    logger
  end

  scenario 'checking all headline articles' do
    home = HomePage.new
    home.load
    expect(home).to be_displayed

    expect(home.navbar.links.size).to be >= 5

    home.slideshow.thumbs.each do |thumb|
      log.info "Clicking thumb link #{thumb['id']}"

      thumb.click
      sleep 0.25

      expect(home.slideshow.selected_thumb['id']).to eq(thumb['id'])

      log.info "Checking image #{home.slideshow.image.src}"
      expect(home.slideshow.image).to be_visible
      expect(home.slideshow.image).to_not be_broken

      expect(home.slideshow.title_link).to be_visible
      expect(home.slideshow.title_link.text).to_not be_empty
      expect(home.slideshow.shortdesc).to be_visible
      expect(home.slideshow.shortdesc.text).to_not be_empty
    end

  end

  scenario 'checking subcategory images' do
    home = HomePage.new
    home.load
    expect(home).to be_displayed

    home.subcategory_images.each do |image|
      log.info "Checking image #{image.src}"
      expect(image).to be_visible
      expect(image).to_not be_broken
    end
  end

end

