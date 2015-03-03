server '54.191.19.139',
  user: 'ubuntu',
  roles: %w{web app db},
  ssh_options: {
    keys: %w(~/.ssh/aws-pbalaban.pem),
    forward_agent: true,
    auth_methods: %w(publickey)
  }

set :linked_files, fetch(:linked_files, []).push('config/settings/staging.yml')
set :sidekiq_default_hooks, -> { true }
