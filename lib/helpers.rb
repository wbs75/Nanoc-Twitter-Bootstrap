module GuideHelper

  def get_pretty_date(guide)
    attribute_to_time(guide[:created_at]).strftime('%B %-d, %Y')
  end

  def get_guide_day(guide)
    attribute_to_time(guide[:created_at]).strftime('%e')
  end

  def get_guide_month(guide)
    attribute_to_time(guide[:created_at]).strftime('%^b')
  end

  def get_guide_date(guide)
    attribute_to_time(guide[:created_at]).strftime('%B %-d, %Y')
  end

  def get_guide_start(guide)
    content = guide.compiled_content
    if content =~ /\s<!-- more -->\s/
      content = content.partition('<!-- more -->').first +
      "<div class='read-more'><a href='#{guide.path}'>read &rsaquo;</a></div>"
    end
    return content
  end

end

include GuideHelper
