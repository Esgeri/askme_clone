module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.png'
    end
  end

  def questions_count
    I18n.translate('question', count: @questions.count)
  end

  def answers_count
    I18n.translate('answer', count: @questions.where.not(answer: nil).count)
  end

  def unanswered_count
    I18n.translate('unanswered', count: @questions_count - @answers_count)
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
