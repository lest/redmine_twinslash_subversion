class Repository::TwinslashSubversion < Repository::Subversion
  validates_presence_of :name
  
  def self.scm_name
    'Twinslash Subversion'
  end
  
  def name=(arg)
    base_url = Setting.plugin_redmine_twinslash_subversion['base_url']
    write_attribute(:url, arg ? base_url + arg : nil)
  end
  
  def name
    base_url = Setting.plugin_redmine_twinslash_subversion['base_url']
    self.url ? self.url.sub(Regexp.new("^#{Regexp.quote(base_url)}"), '') : nil
  end
  
  def after_save
    create_command = Setting.plugin_redmine_twinslash_subversion['create_command']
    system("#{create_command} #{self.name}")
  end
end
