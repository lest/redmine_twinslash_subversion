class Svnauthz
  def self.sync
    base_url = Setting.plugin_redmine_twinslash_subversion['base_url']
    config_location = Setting.plugin_redmine_twinslash_subversion['config_location']
    
    out = "## redmine svnauthz --\n"
    Repository.find(:all, :conditions => {:type => 'TwinslashSubversion'}).each do |repository|
      project = repository.project
      url = repository.url.sub(Regexp.new('^' + Regexp.quote(base_url)), '')
      if url != base_url
        out += "[#{url}:/]\n"
        repository.project.users.each do |user|
          out += "#{user.login} = rw\n"
        end
      end
    end
    out += "## -- redmine svnauthz\n"
    if File.exists?(config_location) then
      config = File.new(config_location).read
      if config =~ /## redmine svnauthz --\n.*?## -- redmine svnauthz\n/m then
        config.gsub!(/## redmine svnauthz --\n.*?## -- redmine svnauthz\n/m, out)
      else
        config += out + "\n"
      end
      f = File.new(config_location, 'w')
      f.write(config)
      f.close
    end
  end
end
