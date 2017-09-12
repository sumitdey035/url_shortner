# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:
set :branch, 'master'
server '176.9.25.46', user: 'sumit', roles: %w{web app db}, primary: true

# Puma configuration
set :puma_environment,  'production'
set :puma_bind,         "tcp://0.0.0.0:4002"