module Refinery
  module ProjectMenus
    class ProjectMenusController < ::ApplicationController

      before_filter :find_all_project_menus
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @project_menu in the line below:
        present(@page)
      end

      def show
        @project_menu = ProjectMenu.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @project_menu in the line below:
        present(@page)
      end

    protected

      def find_all_project_menus
        @project_menus = ProjectMenu.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/project_menus").first
      end

    end
  end
end
