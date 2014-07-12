module Refinery
  module ProjectMenus
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::ProjectMenus

      engine_name :refinery_project_menus

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "project_menus"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.project_menus_admin_project_menus_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/project_menus/project_menu',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::ProjectMenus)
      end
    end
  end
end
