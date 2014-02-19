# RailsAdmin config file. Generated on October 29, 2013 11:03
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|


  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Podcasts', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, 'User'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'User'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = ['Episode', 'Show']

  # Include specific models (exclude the others):
  # config.included_models = ['Episode', 'Show']

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]


  ################  Model configuration  ################

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block

  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.


  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:



  ###  Episode  ###

  # config.model 'Episode' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your episode.rb model definition

  #   # Found associations:

  #     configure :show, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :title, :string 
  #     configure :old_url, :string 
  #     configure :description, :text 
  #     configure :notes, :text 
  #     configure :published_on, :date 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :file_size, :integer 
  #     configure :duration, :integer 
  #     configure :downloads_count, :integer 
  #     configure :mp3_file_name, :string         # Hidden 
  #     configure :mp3_content_type, :string         # Hidden 
  #     configure :mp3_file_size, :integer         # Hidden 
  #     configure :mp3_updated_at, :datetime         # Hidden 
  #     configure :mp3, :paperclip 
  #     configure :number, :integer 
  #     configure :show_id, :integer         # Hidden 
  #     configure :tags, :string 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Show  ###

  # config.model 'Show' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your show.rb model definition

  #   # Found associations:

  #     configure :episodes, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :slug, :string 
  #     configure :title, :string 
  #     configure :short_description, :string 
  #     configure :description, :text 
  #     configure :credits, :text 
  #     configure :keywords, :string 
  #     configure :itunes_url, :string 
  #     configure :stitcher_url, :string 
  #     configure :email, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end

  config.model Episode do
    list do
      field :show
      field :number
      field :title
      field :published_on
      field :downloads_count
    end

    edit do
      group :default do
        field :show
        field :new_mp3_url
        field :mp3
        field :title
        field :description do
          help 'All one line, no formatting or links'
        end
        field :notes do
          help 'Format with Markdown'
        end
        field :published_on
        field :downloads_count do
          read_only true
        end
      end

      group :information do
        help 'Leave blank to have this information automatically populated'
        field :number
        field :file_size
        field :duration
        field :old_url
      end
    end
  end
end
