# load_custom_config
# Rails.application.config.oauth_client_info = YAML.load_file(Rails.root.join('config', 'oauth_client_info.yml'))[Rails.env]
# Rails.application.config.jiguang = YAML.load_file(Rails.root.join('config', 'jiguang.yml'))[Rails.env]
# Rails.application.config.rms = YAML.load_file(Rails.root.join('config', 'rms.yml'))[Rails.env]
# Rails.application.config.jwt = YAML.load_file(Rails.root.join('config', 'jwt.yml'))[Rails.env]
# Rails.application.config.sso = YAML.load_file(Rails.root.join('config', 'sso.yml'))[Rails.env]
# Rails.application.config.admin_controller_actions = YAML.load_file(Rails.root.join('config', 'admin_controller_actions.yml'))[Rails.env]
Rails.application.config.allinpay = YAML.load_file(Rails.root.join('config', 'allinpay.yml'))[Rails.env]
Rails.application.config.weather = YAML.load_file(Rails.root.join('config', 'weather_get.yml'))[Rails.env]

