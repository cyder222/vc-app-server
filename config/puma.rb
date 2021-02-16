# frozen_string_literal: true

# Puma is fast server

workers(1)
preload_app!

socket = File.expand_path('../tmp/puma.sock', __dir__)
bind("unix://#{socket}")

plugin :tmp_restart

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
  defined?(Redis) && Redis.current.disconnect!
end
