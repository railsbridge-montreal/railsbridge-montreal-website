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

  def locale_switcher
    if I18n.locale.to_s == 'fr'
      locale_url = url_for params.merge(locale: 'en')
    else
      locale_url = url_for params.merge(locale: 'fr')
    end
    link_to I18n.t('locale_switcher.label'), locale_url
  end

end
