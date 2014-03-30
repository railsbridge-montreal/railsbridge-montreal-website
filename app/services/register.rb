class Register
  def register(params)
    params = clean_params(params)
    registrant = Registrant.new(params)
    if registrant.save
      Notifier.new_registration(registrant).deliver
    end
    registrant
  end

  def update(id, params)
    params = clean_params(params)
    params.reject! { |param| ['name', 'email'].include? param }
    registrant = Registrant.find(id)
    registrant.update_attributes(params)
  end

  private

  def clean_params(params)
    params.each do |k, v|
      params[k] = true if v == 'true'
      params[k] = false if v == 'false'
    end
    course_params = %w(programmed_before ruby_before rails_before)
    course = determine_course(params.slice(*course_params))
    params.reject { |key| course_params.include? key}.merge(course: course)
  end

  def determine_course(params)
    if !params["programmed_before"]
      "beginner"
    elsif !params["rails_before"]
      "intermediate"
    else
      "advanced"
    end
  end
end
