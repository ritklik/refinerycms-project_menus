module Refinery
  module ProjectMenus
    class ProjectMenu < Refinery::Core::BaseModel
      self.table_name = 'refinery_project_menus'

      attr_accessible :name, :category_code, :position

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
