Rails.application.routes.draw do
  resources :veterinarios, only: [:index, :show, :create, :destroy, :update]

  resources :animals, only: [:index, :show, :create, :destroy, :update] do
    # Nova rota para listar todos os internamentos de um animal
    get 'internamentos', to: 'internamentos#by_animal'
    # Nova rota para listar todas as consultas de um animal específico
    get 'consultas', to: 'consultas#by_animal'
  end

  resources :tutors, only: [:index, :show, :create, :destroy, :update] do
    # Rota aninhada para listar os animais do tutor
    get 'animals', to: 'animals#by_tutor'
  end

  resources :consultas, only: [:index, :show, :create, :destroy, :update] do
    # Rota para listar todas as consultas de um veterinário específico
    get 'veterinario/:veterinario_id', to: 'consultas#by_veterinario', on: :collection
    # Nova rota para listar todas as consultas de um animal específico
    get 'animal/:animal_id', to: 'consultas#by_animal', on: :collection
    # Nova rota para listar todas as prescrições médicas de uma consulta
    get 'prescricoes', to: 'prescricao_medicas#by_consulta'
  end

  resources :prescricao_medicas, only: [:index, :show, :create, :destroy, :update] do
    # Rota para listar todas as prescrições de uma consulta específica
    get 'by_consulta/:consulta_id', to: 'prescricao_medicas#by_consulta', on: :collection
  end

  # Rota para listar todos os internamentos 
  resources :internamentos, only: [:index, :show, :create, :update, :destroy]

  resources :estoques, only: [:index, :show, :create, :update, :destroy]

  # Rota de Sessão de Login
  resources :sessoes, only: [:create, :destroy] # Para login e logout

  # http://localhost:3000/swagger-ui
  get '/api-docs' => 'swagger#index' 
  get '/swagger-ui' => 'swagger_ui#index' 
  get '/swagger-ui/*path' => 'swagger_ui#show' 

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
