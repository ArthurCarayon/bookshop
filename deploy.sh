echo "pull"
git pull origin main
echo "bundle"
bundle
echo "precompile migrate"
rails assets:precompile db:migrate
echo "nginx restart"
sudo service nginx restart
echo "We're done!"