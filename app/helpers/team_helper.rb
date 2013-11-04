module TeamHelper

  def team_member_tag args={}, &block
    raise ArgumentError, "Missing bio" unless block_given?
    args[:bio] = capture(&block)
    TeamMemberPresenter.new(self, args)
  end

end