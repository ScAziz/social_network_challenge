require 'user_repository'
require 'post_class'

class PostRepository

    def all

        post_array = []

        sql_query = 'SELECT id, title, content, view_count, user_id FROM posts;'
        all_posts = DatabaseConnection.exec_params(sql_query, [])

        all_posts.each do |record|
            single_post = Post.new
            single_post.id = record['id'].to_i
            single_post.title = record['title'] 
            single_post.contents = record['contents']
            single_post.view_count = record['view_count']
            single_post.user_id = record['user_id'].to_i

            post_array << single_post
        end
        return post_array
 
    end 

    def find(post_id)

        sql_query = 'SELECT id, title, content, view_count, user_id FROM posts WHERE id = $1;'
        sql_params = [post_id]

        result = DatabaseConnection.exec_params(sql_query, sql_params)

        record = result[0]

        found_post = Post.new
        found_post.id = record['id']
        found_post.title = record['title']
        found_post.contents = record['contents']
        found_post.view_count = record['view_count']
        found_post.user_id = record['user_id']

        return found_post
    end

    def create(new_post)
      new_post = Post.new
      new_post.title = "swimming"
      new_post.contents = "not that keen on it tbh"
      new_post.view_count = "12" 
      new_post.user_id = 2

      sql = 'INSERT INTO posts (title, content, view_count, user_id) VALUES ($1, $2, $3, $4);'
      sql_params = [new_post.title, new_post.contents, new_post.view_count, new_post.user_id]

      DatabaseConnection.exec_params(sql, sql_params)
      
    end

    def delete(post_id)

        sql = 'DELETE FROM posts WHERE id = $1;'
        sql_params = [post_id]
    
        DatabaseConnection.exec_params(sql, sql_params)
        end
end