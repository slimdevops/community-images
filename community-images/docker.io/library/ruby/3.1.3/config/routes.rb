Rails.application.routes.draw do
  get 'api/hello-world', to: 'application#helloWorld'
end
