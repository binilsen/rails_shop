# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin 'bootstrap', to: 'bootstrap.js'
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
