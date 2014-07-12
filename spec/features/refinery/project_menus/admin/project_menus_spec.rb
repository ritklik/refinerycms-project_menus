# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "ProjectMenus" do
    describe "Admin" do
      describe "project_menus" do
        refinery_login_with :refinery_user

        describe "project_menus list" do
          before do
            FactoryGirl.create(:project_menu, :name => "UniqueTitleOne")
            FactoryGirl.create(:project_menu, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.project_menus_admin_project_menus_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.project_menus_admin_project_menus_path

            click_link "Add New Project Menu"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::ProjectMenus::ProjectMenu.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::ProjectMenus::ProjectMenu.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:project_menu, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.project_menus_admin_project_menus_path

              click_link "Add New Project Menu"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::ProjectMenus::ProjectMenu.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:project_menu, :name => "A name") }

          it "should succeed" do
            visit refinery.project_menus_admin_project_menus_path

            within ".actions" do
              click_link "Edit this project menu"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:project_menu, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.project_menus_admin_project_menus_path

            click_link "Remove this project menu forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::ProjectMenus::ProjectMenu.count.should == 0
          end
        end

      end
    end
  end
end
