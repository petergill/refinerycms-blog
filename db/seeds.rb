Refinery::User.all.each do |user|
  if user.plugins.where(:name => 'refinerycms_blog').blank?
    user.plugins.create(:name => "refinerycms_blog",
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end if defined?(Refinery::User)

if defined?(Refinery::Page) and !Refinery::Page.exists?(:link_url => '/award_winners')
  page = Refinery::Page.create(
    :title => "Award Winners",
    :link_url => "/award_winners",
    :deletable => false,
    :menu_match => "^/award_winners?(\/|\/.+?|)$"
  )

  Refinery::Pages.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end
