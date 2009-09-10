module RepositoriesHelper
  def twinslash_subversion_field_tags(form, repository)
    content_tag('p', form.text_field(:name, :size => 60, :required => true, :disabled => (repository && !repository.root_url.blank?)))
  end
end
