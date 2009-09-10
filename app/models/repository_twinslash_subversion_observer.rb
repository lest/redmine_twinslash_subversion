require 'svnauthz'

class RepositoryTwinslashSubversionObserver < ActiveRecord::Observer
  observe :repository
  
  def after_save(repository)
    Svnauthz.sync if repository.is_a?(Repository::TwinslashSubversion)
  end
  
  def after_destroy(repository)
    Svnauthz.sync if repository.is_a?(Repository::TwinslashSubversion)
  end
end
