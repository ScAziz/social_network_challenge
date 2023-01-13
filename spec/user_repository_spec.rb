require 'user_repository'

def reset_users_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
    connection.exec(seed_sql)
  end
  
  describe UserRepository do
    before(:each) do 
      reset_users_table
    end
  
    it "retreives all users from database" do 
        user_repo = UserRepository.new

        users = user_repo.all

        expect(users.length).to eq 2
        expect(users[1].id).to eq 2
        expect(users[1].username).to eq 'anna123'
    end 

    it "retrieves a specific user from the database" do
      user_repo = UserRepository.new
 
      single_user = user_repo.find(2)
    
      expect(single_user.username).to eq 'anna123'
      expect(single_user.email_address).to eq 'anna@gmail.com'
    end 

    it "creates a new user and adds it to the database" do 
        user_repo = UserRepository.new

        new_user = User.new
        new_user.email_address = "hello@email.com"
        new_user.username = 'reallygoodusername'

        user_repo.create(new_user)
        all_users = user_repo.all
        expect(all_users[2].username).to eq 'reallygoodusername'
    end 

    it "deletes an existing user from the database" do 
        user_repo = UserRepository.new

        user_repo.delete(1)
        all_users = user_repo.all
        expect(all_users.length).to eq 1 
    end
  end