module ApplicationHelper
  RECAPTCHA_SITE_KEY = ENV['RECAPTCHA_SITE_KEY']

  def include_recaptcha_js
    raw %(
      <script src="https://www.google.com/recaptcha/api.js?render=#{RECAPTCHA_SITE_KEY}"></script>
    )
  end

  def meta_tag(tag, text)
    content_for :"meta_#{tag}", text
  end

  def yield_meta_tag(tag, default_text='')
    content_for?(:"meta_#{tag}") ? content_for(:"meta_#{tag}") : default_text
  end
end
