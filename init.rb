require 'redmine'

Redmine::Plugin.register :redmine_twinslash_subversion do
  name 'Twinslash Subversion plugin'
  author 'Just Lest'
  description ''
  version '0.0.1'

  settings :default => {
    'base_url' => '',
    'config_location' => '',
    'create_command' => ''
  }, :partial => 'settings/twinslash_subversion_settings'
end

REDMINE_SUPPORTED_SCM.push('TwinslashSubversion')

ActiveRecord::Base.observers << :repository_twinslash_subversion_observer
ActiveRecord::Base.observers << :member_twinslash_subversion_observer
