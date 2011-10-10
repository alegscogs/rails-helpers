require 'alegscogs_helpers/view_helpers'

module AlegsCogsHelpers
  class Railtie < Rails::Railtie
    initializer "alegscogs_helpers.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
