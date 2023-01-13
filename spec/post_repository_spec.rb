# def reset_posts_table
#     seed_sql = File.read('spec/seeds.sql')
#     connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
#     connection.exec(seed_sql)
#   end
  
#   describe PostRepository do
#     before(:each) do 
#       reset_posts_table
#     end
  
    
#   end