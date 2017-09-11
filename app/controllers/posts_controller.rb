class PostsController < ApplicationController
  # Remember to check out: https://rails-sqli.org/
  # And: http://guides.rubyonrails.org/security.html

  # For node & postgresql: https://github.com/brianc/node-postgres/wiki/FAQ#8-does-node-postgres-handle-sql-injection

  def show
    # Compare http://localhost:3000/posts/1
    # with http://localhost:3000/posts/1')%20OR%20('1'%20=%20'1
    @post = Post.where("id = '#{params[:id]}'")
  end

  def index
    @posts = Post.all
  end
end
