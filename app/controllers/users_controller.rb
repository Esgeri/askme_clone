class UsersController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Mirbek',
      username: '@esgeri',
      avatar_url: 'http://secure.gravatar.com/avatar'
    )

    @questions = [Question.new(text: 'Whats up?', created_at: Date.parse('13.04.2018'))]
  end
end
