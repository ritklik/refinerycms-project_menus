class CreateProjectMenusProjectMenus < ActiveRecord::Migration

  def up
    create_table :refinery_project_menus do |t|
      t.string :name
      t.string :category_code
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-project_menus"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/project_menus/project_menus"})
    end

    drop_table :refinery_project_menus

  end

end
