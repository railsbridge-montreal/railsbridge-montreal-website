class Register
  def register(params)
    course_params = %w(programmed_before ruby_before rails_before)
    course = determine_course(params.slice(*course_params))
    @registrant = Registrant.new(params.reject { |key| course_params.include? key}.merge(course: course))
    if @registrant.save
      Notifier.new_registration(@registrant).deliver
    end
    @registrant
  end

  private

  def determine_course(params)
    if params["programmed_before"] == "no"
        "beginner"
    elsif params["ruby_before"] == "no"
      "intermediate"
    else
      "advanced"
    end
  end
end
