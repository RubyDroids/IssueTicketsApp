# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "easymde", to: "https://unpkg.com/easymde/dist/easymde.min.js", preload: true
pin "el-transition", to: "https://ga.jspm.io/npm:el-transition@0.0.7/index.js", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "trix"
pin "@rails/actiontext", to: "actiontext.js"
