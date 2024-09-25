import Config

config :asana,
  access_key: System.get_env("ASANA_ACCESS_KEY") || raise("Missing environment variable ASANA_ACCESS_KEY")

import_config "#{config_env()}.exs"
