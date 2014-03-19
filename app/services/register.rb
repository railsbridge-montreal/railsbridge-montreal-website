class Register
  def register(params)
    course_params = %w(programmed_before ruby_before rails_before)
    course = determine_course(params.slice(*course_params))
    @registrant = Registrant.new(params.reject { |key| course_params.include? key}.merge(course: course))
    if @registrant.save
      Notifier.new_registration(@registrant).deliver
    end
  end

  private

  def determine_course(params)
    "beginner"
  end
end
