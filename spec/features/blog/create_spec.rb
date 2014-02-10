require 'spec_helper'
# rspec --format documentation spec/features/blog/create_spec.rb

describe "Create a Blog" do
  
  def create_blog(options={})
    options[:title]   ||= "My First Blog"
    options[:post]    ||= "This is a post. It should be valid because it is both present and a minimum of 20 characters."
    
    visit "/blogs"
    
    click_link "New Blog"
    expect(page).to have_content("New blog")
    
    fill_in "Title",      with: options[:title]
    fill_in "Post",       with: options[:post]
    
    click_button "Create Blog"
  end
  
  def sign_in
    visit "/blogs"
    
    click_link "Sign up"
    
    fill_in "Email",                       with: "aij06@yahoo.com"
    fill_in "Password",                    with: "secretpassword"
    fill_in "Password confirmation",       with: "secretpassword"
    
    click_button "Sign up"
  end
  
  it "should not allow non-signed in users to create a blog" do
    visit "/blogs"
    
    click_link "New Blog"
    
    expect(page).to have_content("Sign in")
  end
  
  context "when user logged in" do
    
    before(:each) do
      sign_in
    end
    
    
    it "should create a blog when all validations are meet" do
      create_blog
      
      visit "/blogs"
      expect(page).to have_content("My First Blog")
    end
      
    it "should error when the title is not present" do
      create_blog title: " "
      
      expect(page).to have_content("error")
      
      visit "/blogs"
      expect(page).not_to have_content("This is a post. It should be valid because it is both present and a minimum of 20 characters.")
    end
    
    it "should error when the title is not between 3 and 20 characters long" do
      create_blog title: "Hi"
      
      expect(page).not_to have_content("Hi")
    end
    
    it "should error when the post is to short" do
      create_blog post: "This and that"
      
      expect(page).to have_content("error")
      
      visit "/blogs"
      expect(page).not_to have_content("My First Blog")
    end
    
    it "should error when the post is not present" do
      create_blog post: " "
      
      expect(page).to have_content("error")
      
      visit "/blogs"
      expect(page).not_to have_content("My First Blog")
    end
    
    it "should error when the post is not atleast 20 characters long" do
      create_blog post: "Not 20 chars"
      
      expect(page).to have_content("error")
      
      visit "/blogs"
      expect(page).not_to have_content("My First Blog")
    end
    
  end
  
end
