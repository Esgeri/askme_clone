class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Messi',
        username: '@messi',
        avatar_url: 'http://secure.gravatar.com/avatar'
      ),
      User.new(
        id: 2,
        name: 'Ronaldu',
        username: '@ronaldu'
      )
    ]
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

    @questions = [
      Question.new(text: 'Whats up?', created_at: Date.parse('13.04.2018')),
      Question.new(text: 'How do you do?', created_at: Date.parse('14.04.2018')),
      Question.new(text: 'How are you?', created_at: Date.parse('16.04.2018'))
    ]

    @new_question = Question.new
  end
end
