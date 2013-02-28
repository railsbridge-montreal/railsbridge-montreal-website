require_dependency Georgia::Engine.decorator_path :page

module Georgia
  class PageDecorator

    def text
      h.raw(h.snippetize((content.text or '')))
    end

  end
end