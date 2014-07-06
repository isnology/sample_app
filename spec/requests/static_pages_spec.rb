require 'spec_helper'

describe "Static Pages" do

  let(:base_title) {"Ruby on Rails Tutorial Sample App"}
  let(:sp) {'/static_pages/'}
  let(:root_path) {sp+'home'}
  let(:about_path) {sp+'about'}
  let(:contact_path) {sp+'contact'}

  describe "Home page" do
    it "should have the h1 'Sample App'" do
      visit root_path
      page.should have_selector('h1', text: 'Sample App')
    end

    it "should have base title" do
      visit root_path
      page.should have_selector('title',
                  text: "#{base_title}")
    end

    it "should not have a custom page title" do
      visit root_path
      page.should_not have_selector('title', text: '| Home')
    end
  end

  describe "Help Page" do
    it "should have the h1 'Help'" do
      visit help_path
      page.should have_selector('h1', text: 'Help')
    end

    it "should have base title" do
      visit help_path
      page.should have_selector('title',
                                text: "#{base_title}")
    end

    it "should not have a custom page title" do
      visit help_path
      page.should_not have_selector('title', text: '| Help')
    end

  end

  describe "About page" do
      it "should have the h1 'About Us'" do
        visit about_path
        page.should have_selector('h1', text: 'About Us')
      end

      it "should have base title" do
        visit about_path
        page.should have_selector('title',
                                  text: "#{base_title}")
      end

      it "should not have a custom page title" do
        visit about_path
        page.should_not have_selector('title', text: '| About Us')
      end
  end

  describe "Contact page" do
    it "should have the h1 'Contact'" do
      visit contact_path
      page.should have_selector('h1', text: 'Contact')
    end

    it "should have base title" do
      visit contact_path
      page.should have_selector('title',
                                text: "#{base_title}")
    end

    it "should not have a custom page title" do
      visit contact_path
      page.should_not have_selector('title', text: '| Contact')
    end
  end
end
