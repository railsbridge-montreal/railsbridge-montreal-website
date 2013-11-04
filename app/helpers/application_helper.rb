module ApplicationHelper

  def icon_tag icon
    content_tag :i, nil, class: "fa fa-#{icon}"
  end

  def production_website?
    /railsbridge-montreal\.com/ === request.host
  end

  def eventbrite_url
    'http://railsbridgemtl-nov2013-es2.eventbrite.ca/'
  end

end
