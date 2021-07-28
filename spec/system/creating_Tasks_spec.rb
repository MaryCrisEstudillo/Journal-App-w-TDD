require 'rails_helper'

RSpec.describe "CreatingTaskPosts", type: :system do
  before do
    driven_by(:rack_test)
  end

    it 'create and display Task Posts' do
      #visit root route
      visit '/'
      #link to create post
      click_link 'Create Task'
      #fill in the form
      fill_in 'title', with: 'title'
      fill_in 'description', with: 'description'
    
      click_button 'Submit Task'
    
      expect(page).to have_content('title')
      expect(page).to have_content('description')
    
      blog_post = BlogPost.order("id").last
      expect(blog_post.title).to eq('title')
      expect(blog_post.body).to eq('description')
      end
end
