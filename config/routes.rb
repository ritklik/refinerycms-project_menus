Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :project_menus do
    resources :project_menus, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :project_menus, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :project_menus, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
