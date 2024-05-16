# Pin npm packages by running ./bin/importmap

pin 'application'
pin '@hotwired/turbo-rails', to: 'turbo.min.js'
pin '@hotwired/stimulus', to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'bootstrap', to: 'https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js' # @5.3.3
pin '@rails/ujs', to: '@rails--ujs.js' # @7.1.3
#pin '@popperjs/core', to: '@popperjs--core.js' # @2.11.8
