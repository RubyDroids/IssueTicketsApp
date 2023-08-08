# frozen_string_literal: true

# render Layout::Navbar::Component.new(title: "Hello, world!")
module Layout
  module Navbar
    class Component < ViewComponent::Base
      include Devise::Controllers::Helpers
      include ApplicationHelper

      def labels
        Label.pluck(:name, :id).map { |name, id| { name: I18n.t("views.labels.#{name}"), id: } }
      end
    end
  end
end
