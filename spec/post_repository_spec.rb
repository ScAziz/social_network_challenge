require 'post_repository'

def reset_posts_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
    connection.exec(seed_sql)
  end
  
  describe PostRepository do
    before(:each) do 
      reset_posts_table
    end
  
    it "retrieves all posts" do
      post_repo = PostRepository.new

       all_posts = post_repo.all

       expect(all_posts.length).to eq 4

       expect(all_posts[0].user_id).to eq 1
    end

    it "retrieves a specific post" do 
      post_repo = PostRepository.new

      single_post = post_repo.find(1)
      expect(single_post.title).to eq 'tuesday'  
    end 

    it "creates a new post and adds it to the database" do
      post_repo = PostRepository.new

      new_post = Post.new
      new_post.title = "swimming"
      new_post.contents = "not that keen on it tbh"
      new_post.view_count = "12" 
      new_post.user_id = 2
      
      post_repo.create(new_post)
      new_posts = post_repo.all
      expect(new_posts.length).to eq 5
    end

    it "deletes a specific post" do
      post_repo = PostRepository.new

      post_repo.delete(1)

      remaining_posts = post_repo.all
      expect(remaining_posts.length).to eq 3
    end 
  end