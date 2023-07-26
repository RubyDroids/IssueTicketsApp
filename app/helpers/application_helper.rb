module ApplicationHelper
  include Pagy::Frontend

  def badge(label)
    badge_color = custom_badge_color(label)
    content_tag(:span, I18n.t("views.labels.#{label}"), class: "badge badge-#{badge_color} ml-3")
  end

  def radio_input_color(label)
    badge_color = custom_badge_color(label)
    "radio-#{badge_color}"
  end

  def custom_badge_color(label)
    case label.downcase
    when "bug" then "red"
    when "enchantment" then "green"
    when "feature" then "blue"
    when "question" then "blue"
    when "hotfix" then "orange"
    else
      "default"
    end
  end
end
