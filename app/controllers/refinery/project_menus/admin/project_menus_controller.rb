module Refinery
  module ProjectMenus
    module Admin
      class ProjectMenusController < ::Refinery::AdminController

        crudify :'refinery/project_menus/project_menu',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
