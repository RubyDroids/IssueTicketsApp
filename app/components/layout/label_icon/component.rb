# frozen_string_literal: true

# render Layout::LabelIcon::Component.new(label: label_name)
module Layout
  module LabelIcon
    class Component < ViewComponent::Base
      include ApplicationHelper
      attr_reader :label

      def initialize(label:)
        @label = label.downcase
      end

      def render_icon
        case label.to_sym
        when :bug
          icon("fa-solid", "bug", class: "fa-xl mt-3 text-red-600")
        when :feature
          icon("fa-solid", "feather", class: "fa-xl mt-3 text-blue-600")
        when :question
          icon("fa-solid", "circle-question", class: "fa-xl mt-3 text-indigo-600")
        when :hotfix
          icon("fa-solid", "fire", class: "fa-xl mt-3 text-orange-600")
        when :enhancement
          icon("fa-solid", "cube", class: "fa-xl mt-3 text-green-600")
        end
      end
    end
  end
end
