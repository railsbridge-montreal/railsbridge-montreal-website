class PagesController < ApplicationController

  before_filter :prepare_menu

  def show
    @page = Georgia::Page.find_by_slug(params[:slug]) || not_found
    not_found unless @page.published?
    @page = @page.decorate
  end

  def search
    @pages = Georgia::Page.search(params[:q]).where("slug != 'home'").page(params[:page]).per(5).decorate
  end

  protected

  def prepare_menu
    @navigation_menu = Georgia::Menu.find_by_name('Main')
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

end
