class TeamMemberPresenter

  attr_accessor :view_context

  delegate :content_tag, :image_tag, to: :view_context

  def initialize view_context, args={}
    @view_context = view_context
    @avatar = args.fetch(:avatar, '')
    @name = args.fetch(:name, 'Anonymous')
    @bio = args.fetch(:bio, '')
  end

  def to_s
    content_tag :div, class: 'media team-member' do
      content_tag(:div, thumbnail, class: 'pull-left') +
      content_tag(:div, heading + @bio, class: 'media-body')
    end
  end

  private

  def heading
    content_tag :h4, @name, class: 'media-heading'
  end

  def thumbnail
    image_tag(@avatar, class: 'img-circle')
  end

end