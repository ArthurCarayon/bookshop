module ApplicationHelper
  RECAPTCHA_SITE_KEY = ENV['RECAPTCHA_SITE_KEY']

  def include_recaptcha_js
    raw %Q{
      <script src="https://www.google.com/recaptcha/api.js?render=#{RECAPTCHA_SITE_KEY}"></script>
    }
  end

end
