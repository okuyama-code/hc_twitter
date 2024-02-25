#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# ============= 追記　始め ===================
# production環境の場合のみ
if [ "$RAILS_ENV" = "production" ]; then
  bundle exec rails assets:precompile
  # --------------------------------------
  # 本番環境（AWS ECS）への初回デプロイ時に利用
  # 初回デプロイ後にコメントアウトして下さい
  # bundle exec rails db:create
  # --------------------------------------
  # 2回目以降のデプロイ時に利用
  bundle exec rails db:migrate
fi
# ============= 追記　終わり ===================

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
