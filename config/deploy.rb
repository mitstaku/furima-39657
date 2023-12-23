# capistranoのバージョンを記載。固定のバージョンを利用し続け、バージョン変更によるトラブルを防止する
lock '3.18.0'

# Capistranoのログの表示に利用する
set :application, 'furima-39657'

# どのリポジトリからアプリをpullするかを指定する
set :repo_url,  'git@github.com:mitstaku/furima-39657.git'
set :branch, 'main'

# バージョンが変わっても共通で参照するディレクトリを指定
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '3.2.0' #カリキュラム通りに進めた場合、’3.2.0’ です

# どの公開鍵を利用してデプロイするか
set :ssh_options, auth_methods: ['ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDEhx6/de89T/f0TGEb59GI9cqgx3IHIJsp8OtzD1Lb9cY6doTpRAm2j0/p1+l++W+3Q44to5aloaMInu8oiEbi0mfjDtmWwhlCRzyr1PEV+wRxEhV+1enoxr+A7+JZCaqaMdgdAFJJ8AOtAy7aV9XVFZgY/acOQUBbm0t+xhCAfRu8gZQlY8lPGaWRAwBI2LYnlmbDW2pLqUKe129XLPVpmuX+pgfwLgyKQhNQ+rNFOZ0K/0sC4apchiPA3pDFmCtR+3W8lVeSDgYPwFia5tV+2Qskn8EjZHNdPapije/y4/AsJcZwE4CWfPfk2cq6CE+EpoXVHEINRAp/7WIPaspfHo8lZkJ9kn7O/qGpDu9W1HzNzn8zwFY89RnYgXW8WldPfQUBB41z/H71Vi9Mid5Lwq13jcA/5LZ/rHlMXgcy9piz1ZzVBqiWJdxFIbKuTHkytZGS8UsjTk1VNiAAzleN9dJqJhunW0xG5KrmxgCqg4nbKCkDwiKcpagHYsYkNWsUNIJ39dzEKSNflecRZDHcTZ1ydT5IOLBRvZbpjK4iNqau+52U4SdfktQK09JjviCcngYNJf+XCXsJ/A+01BfqTrQXL+7Xod1VREUUfRioyc5/utDohZmT2Q6biPej0kZxksHEQ1yuTn6DWYHKi20PujKnIl5bEMZPdy2erA0aqw== ec2-user@ip-172-31-43-83.ap-northeast-1.compute.internal'],
                                  keys: ['~/.ssh/furima.pem'] 

# プロセス番号を記載したファイルの場所
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# Unicornの設定ファイルの場所
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

# デプロイ処理が終わった後、Unicornを再起動するための記述
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
