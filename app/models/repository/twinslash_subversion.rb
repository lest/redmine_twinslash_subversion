class Repository::TwinslashSubversion < Repository::Subversion
  def self.scm_name
    'Twinslash Subversion'
  end

  def project=(project)
    super
    base_url = Setting.plugin_redmine_twinslash_subversion['base_url']
    write_attribute(:url, base_url + project.identifier)
  end

  def after_save
    create_command = Setting.plugin_redmine_twinslash_subversion['create_command']
    system("#{create_command} #{project.identifier}")
  end
end
