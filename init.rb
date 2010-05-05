require 'redmine'

Redmine::Plugin.register :redmine_twinslash_subversion do
  name 'Twinslash Subversion plugin'
  author 'Just Lest'
  description ''
  version '0.1.0'

  settings :default => {
    'base_url' => '',
    'create_command' => ''
  }, :partial => 'settings/twinslash_subversion_settings'
end

Redmine::Scm::Base.add 'TwinslashSubversion'
