module TeamHelper

  def team_member_tag args={}, &block
    args[:bio] = capture(&block) if block_given?
    TeamMemberPresenter.new(self, args)
  end

end
