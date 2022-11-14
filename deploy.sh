git pull origin main
bundle
rails assets:precompile db:migrate
sudo service nginx restart