class Register
  attr_reader :params_processors

  def initialize(params_processors: nil)
    @params_processors = params_processors || default_params_processors
  end

  def register(params)
    params = process_params(params)
    registrant = Registrant.new(params)

    if registrant.save
      Notifier.new_registration(registrant).deliver
    end
    registrant
  end

  def update(id, params)
    params = process_params(params)
    params.reject! { |param| ['name', 'email', 'waitlisted'].include? param }
    registrant = Registrant.find(id)
    registrant.update_attributes(params)
  end

  private

  def default_params_processors
    [BooleanParamsConverter.new, CourseLevelDeterminer.new]
  end

  def process_params(params)
    params_processors.reduce(params) { |params, processor| processor.call(params) }
  end
end
