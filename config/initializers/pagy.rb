# frozen_string_literal: true

require "pagy"
require "pagy/extras/overflow"
require "pagy/extras/i18n"

Pagy::DEFAULT[:items] = 25 # items per page
# Pagy::DEFAULT[:size]  = [1,4,4,1] # nav bar links

# Better user experience handled automatically
Pagy::DEFAULT[:overflow] = :last_page
