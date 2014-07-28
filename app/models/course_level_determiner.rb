# Determines the course level based on qualifying questions contained in the
# parameter hash, removing the qualifying questions from the params hash once
# completed.
#
class CourseLevelDeterminer
  def call(params)
    course = determine_course(params)
    params = remove_qualifying_params(params)
    add_course_level(params, course)
  end

  private

  def determine_course(params)
    if !params[:programmed_before]
      "beginner"
    elsif !params[:rails_before]
      "intermediate"
    else
      "advanced"
    end
  end

  def add_course_level(params, course)
    params.merge(level: course)
  end

  def remove_qualifying_params(params)
    params.reject { |key| default_qualifying_params.include? key.to_sym}
  end

  def default_qualifying_params
    %i(programmed_before ruby_before rails_before)
  end
end
