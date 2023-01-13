require 'user_class'

class UserRepository
    def all

        user_array = []

        sql_query = 'SELECT id, email_address, username FROM users;'
        all_users = DatabaseConnection.exec_params(sql_query, [])

        all_users.each do |record|
            single_user = User.new
            single_user.id = record['id'].to_i
            single_user.email_address = record['email_address'] 
            single_user.username = record['username']

            user_array << single_user
        end
        return user_array
 
    end 

    def find(id)
        sql_query = 'SELECT id, email_address, username FROM users WHERE id = $1;'
        sql_params = [id]

        result = DatabaseConnection.exec_params(sql_query, sql_params)

        record = result[0]

        found_user = User.new
        found_user.id = record['id']
        found_user.email_address = record['email_address']
        found_user.username = record['username']

        return found_user
        
    end

    def create(new_user)
        new_user = User.new
        new_user.email_address = "hello@email.com"
        new_user.username = 'reallygoodusername'
        
        sql = 'INSERT INTO users (email_address, username) VALUES ($1, $2);'
        sql_params = [new_user.email_address, new_user.username]

        DatabaseConnection.exec_params(sql, sql_params)

    end

    def delete(user_id)

    sql = 'DELETE FROM users WHERE id = $1;'
    sql_params = [user_id]

    DatabaseConnection.exec_params(sql, sql_params)
    end
end