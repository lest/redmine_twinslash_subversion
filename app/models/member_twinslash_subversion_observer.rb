require 'svnauthz'

class MemberTwinslashSubversionObserver < ActiveRecord::Observer
  observe :member
  
  def after_save(member)
    Svnauthz.sync if member.project.repository.is_a?(Repository::TwinslashSubversion)
  end
  
  def after_destroy(member)
    Svnauthz.sync if member.project.repository.is_a?(Repository::TwinslashSubversion)
  end
end
