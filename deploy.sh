git pull origin main
bundle
rails assets:precompile
rails db:migrate
sudo service nginx restart