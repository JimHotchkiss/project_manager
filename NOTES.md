# The ProjectManager 
- Developer can create a Project
- Developer is the Project_manager of that Project
- On the Projects page, a list of Projects will render
    * If you're the Project_manager, you can assign the project to different developer(s)
    * If you're a developer, you can assign yourself to the project
        - The project_manager can override this self assignment
    * When you click on a project, the project details are rendered. 
    * In addition to the project's name, description and date create, a list of tasks are also list
    * Each task can have a project_task
        - A task may not be unique to that project. For instance, 'build navbar' is consistent across most projects. However, 'build special navigation specific to customer's specs', is unique to that project, and that is why it's a project_task (see below associations)
    * Project_manager can assign a task to a project_developer, or the project_developer can assign themselves the task
        - Project_manager can override that assignment
    * When a task is assign, either way, for the other project_developers the once 'accept' button will list the project_developer assigned to that task
        - For the project_manager, the button will switch from 'assign' to 're-assign'
    * Tasks will have project_task. Both a task and the subsequent project_task(s) will have checkmark (or maybe a button for the project_task) signifying complete. 
    * When a task's project_tasks are all complete, the text will turn green
# Project   
    - has_many :project_developers
    - has_many :developers, through: :project_developers
    - belongs_to :project_manager
    - has_many :project_task
    - has_many :tasks, through: :project_task
# ProjectDeveloper
    - belongs_to :project
    - belongs_to :devloper
# Developer 
    - has_many :project_developers
    - has_many :projects, through: :project_developers
# Project_manager
    - has_many :projects

# ProjectTask
    - belongs_to :project
    - belongs_to :task
# Task
    - has_many :project_tasks
    - has_many :projects, through: :project_tasks




# 3/21/2021 - Avi Project Build
[X] Create Project
[X] Wire up Javascript
    - Note - Seems the most straight forward way, is to add a javascript file in the app/javascript/packs directory, and then add a Rails tag helper in the application.html.erb view 
        * app/javascript/packs/some_javascript.js
        * app/views/layouts/application.html.erb 
            - <%= javascript_pack_tag 'some_javascript' %>
[X] Render Navbar
[] Rails generate Project 
    - Note: rails generate resource Project name:string number_of_developers:integer description:text
    (x) Model
        - Name 
        - Number_of_developers
        - Description
    () Controller
    () View
    () Routes

# 3/22/2021 - Avi Project Build
[X] Rails generate Project 
    - Note: rails generate resource Project name:string number_of_developers:integer description:text
    (x) Model
        - Name 
        - Number_of_developers
        - Description
    (x) Change to Project model
        (x) Change name to title
        - Note: rails db:drop -> make changes -> rails db:create -> rails db:migrate
[] Project new - Forms
    - User clicks 'Create Project'
    - Our URL shows projects/new
    - Project controller and new method is hit
    - Form is rendered
        - Note: db tables - plural
                Controllers - plural
                Models - Singular
    () URL - projects/new
        - This is handled by Rails resources 
Note - Video - Rails Models, Routes, Forms, Path Helpers ~ hour

# 3/23/2021
[X] Project new - Forms
    - User clicks 'Create Project'
    - Our URL shows projects/new
    - Project controller and new method is hit
    - Form is rendered
        - Note: db tables - plural
                Controllers - plural
                Models - Singular
    (x) Navigation
        (x) Projects#index navigation
            - <%= link_to "Projects", '/projects' %>
                * For the path, use _path. For instance, instead of "./projects", to render the Projects index, you can use projects_path.
                * Rails routes will show you the prefix to use. For instance, new_project, is the prefix for "/projects/new". So the _path would be new_project_path
        (x) Projects#new navigation
            - <%= link_to "Create Project", '/projects/new' %>
[] Submit Form 
    - Note: Form would not submit, when testing it. I found that I did not have an openning div, and this prevent the form from submitting.
    (x) Strong params 
    (x) Create method
    (x) Show view 
        (x) @project variable is showing up nil, on the Project show page. View is rendering though.
            - Note: The new method reroutes to the show method. There you'll search for the instance with .find(params[:id]). Show method implicitly reroutes to the show view
    () Form validations
    (x) URL - projects/new
        - This is handled by Rails resources 
[X] Create 
    (x) Technology
    (x) ProjectTechnology
    (x) Create associates in Models
    (x) Test in Rails console
Note - in app/javascript/stylesheets/tailwind.config.js, I changed the transition default time from 150ms to 300ms
Note - rails g resource (naming convention)
    - Table is singular and camelCase
    - The row is snake_case
    - rails g resource Technology name:string
    - rails g ProjectTechnology name:string

# 3/24/2021
    [X] Schema is associated incorrectly
        - ProjectTechnology did not come out right
        (x) rails db:drop
        (x) Delete schema
        (-) Delete migrations - Didn't have to
        (-) Correctly generate ProjectTechnology - Didn't have to
        (x) rails db:create
        (x) rails db:migrate
    [] Submit Form 
    - Note: Form would not submit, when testing it. I found that I did not have an openning div, and this prevent the form from submitting.
    (x) Strong params 
    (x) Create method
    (x) Show view 
        (x) @project variable is showing up nil, on the Project show page. View is rendering though.
            - Note: The new method reroutes to the show method. There you'll search for the instance with .find(params[:id]). Show method implicitly reroutes to the show view
    () Form validations
    (x) URL - projects/new
        - This is handled by Rails resources 
# With ProjectTechnologies, there is no attribute that the use can add
# So I'm going to change it to Rescource
    * Resource will have a url as an attribute
[X] Add Resource as join-table
    (x) Delete ProjectTechnology Controller
    (x) Model
    (x) View
    (x) Delete schema
    (x) Edit migration
    (x) Delete route
# 3/25/2021
[X] Switch to Resource as join-table
    (x) Delete ProjectTechnology Controller
    (x) Model
    (x) View
    (x) Delete schema
    (x) Edit migration
    (x) Delete route

Note - When you have a belongs_to association, like in our Resource join table, it comes with six methods. 'association' is replaced with the specific model
    - association
    - association=(associate)
    - build_association(attributes = {})
    - create_association(attributes = {})
    - create_association!(attributes = {})
    - reload_association
Note - raise params.inspect
[X] Nested forms 
    * forms_for is used to create the association fields
    * Note: When originally setup, an empty element was being added to the check_box params. You have to add a 'hidden' attribute
        -  <%= f.collection_check_boxes(:technology_ids, Technology.all, :id, :name, include_hidden: false) do |t| %>
    (x) Creating a new Technology
        * fields_for helper takes two arguments: the associated model we're creating and an object to wrap around.
            <%= f.fields_for :technologies, project.technologies.build do |technologies_fields| %>
                <%= technologies_fields.text_field :name %>
            <% end %>
        * Our params hash will now have a key of :technologies_attributes nest under the key of project
            - In our project_params, we add this technologies_attribute
                * technologies_attributes: [:name]
            - In our Project model, we'll add accepts_nested_attributes_for :technologies
            # Note - There is a problem though. We are now create a new Technology instance, regardless if it's already been create. We utilize the techologies_attributes= method. This checks if there is another instance of this technology, and if there is not, it creates and adds it to self.technologies << 
                * remove accepts_nested_attributes_for
             def technologies_attributes=(technology_attributes)
                technology_attributes.values.each do |technology_attribute|
                technology = Technology.find_or_create_by(technology_attribute)
                self.technologies << technology
                end
            end
            # You can use accepts_nested_ method, with some modifactions, and it does the same as the custom writer
             accepts_nested_attributes_for :category, reject_if: proc { |attributes| attributes['name'].blank? }

# 3/26/2021
    [X] Look at params in the Project model. It instantiating an empty attribute.
        Note - It seems that the technologies_attributers is intantiating a blank string, but only on the first.
        - This is the code from _form that is the nested technologies part
            <!-- Create Technology-->
            <div class="mb-1">Add a Technology</div>
            <div class=" flex flex-col mb-3">
                <%= f.fields_for :technologies do |technologies_fields| %>
                    <%= technologies_fields.text_field :name, class:"mb-3 h-9 focus:outline-none" %>
                <% end %>
            </div>
        - Strong params 
            technologies_attributes: [:name]
        - Resources place holder code. 
            !-- Create Resource -->
            <div class="mb-1">Add a Resource</div>
                <div class=" flex flex-col mb-3">
            </div>
        * So when I remove the nested portion, an empty object is NOT instantiated. The issue is coming from the fields for. 
[X] Switch to Resources as join-table
    (x) Delete ProjectTechnology:
    (x) Controller
    (x) Model
    (x) View
    (x) Delete schema
    (x) Delete resource migration
        t.belongs_to :technology, foreign_key: true
        t.belongs_to :project, foreign_key: true
        t.string :url
    (x) Delete route
### When I use accepts_nested_ it does not create a blank entry for Technology, but it allows duplicates. If I use custom setter, it does not allow duplicates, but will allow blanks.
#### Some of my confusion is that I'm trying to image one join table, but what I really need is two: One for ProjectTechnology and one for Resource
    - When I check 'Python', and add 'Python', it doesn't instantiate two new Pythons, it does however add the same python twice. I looked, though there listed twice, it's the same id.

# Project#index - 
            <p class="p-4 font-semibold">Number of Developers: <span class="font-light"><%= project.number_of_developers%></span></p>

            <!-- Display Technologies -->
            <p class="ml-4 font-semibold">Project Technologies:</p>
            <div class="ml-4 mb-2 max-w-md">
                <% project.technologies.each do |technology|  %>
                    <p class="pt-1 font-light"><%= technology.name%></p>
                <% end %>
            </div>
# 3/27/2021
[] Add the Resource attribute 'url'
    () Double nested forms - Associating the Resource join table with the Technology Table
        () First we need to update our form to include resources.
            - It will go Projects --> Resources --> Technologies
            - One of the big differences with our double nested form, is our technologies model isn't dictated by @project with the prefix variable 'f', but rather our resource model, and the associated prefix variable, in thie case, resource_fields (I wrote it out explitly, for the clarity)
                 <%= f.fields_for :resources do |resources_fields| %>

                    <div class="mb-1">Add a Technology</div>
                    <div class=" flex flex-col mb-3">
                        <%= resources_fields.fields_for :technologies do |technologies_fields| %>
                            <%= technologies_fields.text_field :name, class:"mb-3 h-9 focus:outline-none" %>
                        <% end %>
                    </div>
            
            - We now have to tell the form about this association
                * We need to go to our Project controller, and instead of creating a @technology.build, we want to create a @resources.build
                * Then we'll reference technologies through the relationship between resources and technologies
            Noted: At this point, be sure to inspect the form, and what the form_for is creating. Namely, look at the relationship
                * <input class="mb-3 h-9 focus:outline-none" type="text" name="project  [resources_attributes][0][technologies][name]" id="project_resources_attributes_0_technologies_name">
                - However, we want our technologies[name] to read technologies_attributes[name]
                    * We want to move our technolories_attributes to the Resource model, and change it from plural to singular, technology_attributes
                    * This is done in the Project model in the resources_attributes method
            Note: When doing nested form, the sigular and plural matter. For instance, we updated the Recourse model to reflect technology_attributes, in order to get technologies_attributes[name] in our forms, but it didn't reflect appropriate in our form.
            In the form, nested under resource, it still read resources_fields.fields_for :technologies. This pluralization of techology prevented the form from creating the technologies_attributes[name]
            - Now we need to tell our controllers that we want to build an ingredient. So we'll go into our Project controller, and utilize the technology_build method, that the belongs_to association gives us. 
                *  {@project.resources.build} was replaced with a block 
                    3.times do 
                        resource = @project.resources.build
                        resource.build_technology
                    end 
                * Now we have the technologies_attributes[name] in our form that we need
            - Now we want to update our recipe_params to reflect our new association
                * project[resources_attributes][0][technology_attributes][name]
                    - resources_attributes:[technology_attributes:["name"]]
            - Be sure to throw a pry into the Project create, and make sure that our strong params are indeed working. 
                <ActionController::Parameters {"title"=>"Test Double Nested Form", "description"=>"Test double nested form", "number_of_developers"=>"2", "technology_ids"=>["1"], "resources_attributes"=><ActionController::Parameters {"0"=><ActionController::Parameters {"technology_attributes"=><ActionController::Parameters {"name"=>"C#"} permitted: true>} permitted: true>, "1"=><ActionController::Parameters {"technology_attributes"=><ActionController::Parameters {"name"=>""} permitted: true>} permitted: true>, "2"=><ActionController::Parameters {"technology_attributes"=><ActionController::Parameters {"name"=>""} permitted: true>} permitted: true>} permitted: true>} permitted: true>
            - Once our strong params are working, throw a pry in both the resources_attributes and the technology_attributes methods in the Project and Resource model, respectively.
            - Let now add our resource field to our form
                * At this point we do need to add, in this case, our url attribute to the project_params
                    params.require(:project).permit(:title, :description, :number_of_developers, technology_ids:[], resources_attributes:[:url, technology_attributes:[:name]]
                        * Note - technology_attributes is nested in resources_attributes, after the :url attribute
                            - Also, if resource ends up having more attributes we woul just list them after the :url
            - If we now throw pry(s) into resources_attributes (under the resources_attributes.value.each do)
            and into the techology_attributes, when we hit the resources_attibutes, we can type in Resource.create(resource_attribute). We'll now hit the technology_attribute in the Resource model.
                * Note - With a join table, you should NOT use .find_or_create_by
# Update - Made good headway today
    * We can still select a technology and manually enter the same technology, and though it won't persist it does get shoveled into our self.resources
        - In Project:  && !self.resources.include?(resource_attribute[:technology_attributes]) doesn't prevent adding the technology object.
[] Create User (Developer?)
    () Developer 
        (x) gem 'bcrypt'
            - Bundle install
        (x) Developer Table 
            (x) password_digest
            (x) username
            (x) email
        (x) Developer Model
            (x) has_secure_password
        (x) Developer Form
            [X] NOTE - Form will not submit
                - Fixed - You have to enclose a form_for in a div!
            (x) Validation - uniqueness
                - validation :username, uniqueness: true, presence: true
            (x) Register
            (x) Login
                - Note: Controller, when using generator, should be plural, rails g controller Sessions
                - Note: @user.authenticate(params[:user][:password]) - do not put in the authenticate method password: params[:user][:password]. I did, and it drove me crazy
                (x) Urls 
                    (x) get '/login', to: 'sessions#new'
                    (x) post '/login', to: 'sessions#create'
                    (x) delete '/logout', to: 'sessions#destroy'

    <!-- Facebook Google login-->
</div>



[] Validations - Validations are there to project the database, to make sure that 'bad' data is not sent to the database
    - 'require' in forms field are for the benifit of the user and the UI
    () Add errors and validation to Registration and Login
    Note: Having issues sorting out errors - I don't think it's very hard, I'm just tired.
# Note: Unable to get validations to work correctly.
    - Throw in a binding.pry, after the else, in the create method, and see if the instance variable is still their.
       <!-- Errors -->
        <%= render partial: 'layouts/errors', locals: {object: @project}%>






Resource - Facebook and Google buttons
    <div class=" bg-gray-300">
    <div class="container flex justify-center py-20">
        <div class="p-8 bg-white rounded-lg max-w-md pb-10">
            <div class="flex justify-center mb-4"> <img src="https://i.imgur.com/f6Tb5U1.png" width="70"> </div> <input type="text" class="h-12 rounded w-full border px-3 focus:text-black focus:border-blue-100" placeholder="Name"> <input type="text" class="h-12 mt-3 rounded w-full border px-3 focus:text-black focus:border-blue-100" placeholder="Email"> <input type="text" class="h-12 mt-3 rounded w-full border px-3 focus:text-black focus:border-blue-100" placeholder="Password"> <input type="text" class="h-12 mt-3 rounded w-full border px-3 focus:text-black focus:border-blue-100" placeholder=" Retype password"> <button class="uppercase h-12 mt-3 text-white w-full rounded bg-red-700 hover:bg-red-800">Register</button>
            <div class="flex justify-between items-center mt-3">
                <hr class="w-full"> <span class="p-2 text-gray-400 mb-1">OR</span>
                <hr class="w-full">
            </div> <button class="uppercase h-12 mt-3 text-white w-full rounded bg-blue-800 hover:bg-blue-900"><i class="fa fa-facebook mr-2"></i>Facebook</button> <button class="uppercase h-12 mt-3 text-white w-full rounded bg-red-800 hover:bg-red-900"><i class="fa fa-google mr-2"></i>Google</button>
        </div>
    </div>
</div>

              

   
    () Custom writer - If you create a custom writer, you can't use accepts_attributes_...
    - Find good resource to review.
    -  <!-- Create Resource-->
          <div class="mb-1">Add a Resource</div>
           <div class=" flex flex-col mb-3">
           <%= f.fields_for :resources do |resources_fields| %>
               <%= resources_fields.text_field :url, class:"mb-3 h-9 focus:outline-none" %>
           <% end %>
          </div>

[] User login














## Note: When building models with resource, remember to add --no-test-framework
## Associations
- Note - db:migrate:reset does db:drop, db:create, db:migrate does db:drop, db:create and db:migrate
    # Project 
        - has_many :resources
        - has_many :technologies, through: :resources
    # Technology
        - has_many :resources
        - has_many :projects, through: :resources
    # Resource
        - belongs_to Project
        - belongs_to Technology
        - url:string ? 

            Note - This model can be renamed
Note - Video - 5/4 FT Rails Models, Routes, Forms, Path Helpers ~ hour

Note - rails generator resource - Will build a Model, Controller, View and Route resources
Note - For styling, consider using Tailwinds. Video on Youtube for installing -https://www.youtube.com/watch?v=3xcUSIu3nXA
    * yarn add tailwindcss
    * npx tailwindcss init
        - This creates a tailwind.config.js config file
    * With Tailwind, things need to be configured a little (or a lot) different
        - in the javascript folder, create a stylesheets folder
            - Move the tailswind.config.js file into the new stylesheets folder
            - In javascript/stylesheets, create an application.scss file
                * Import: 
                    @import "tailwindcss/base";
                    @import "tailwindcss/components";
                    @import "tailwindcss/utilities";
    * Quick correction. The npx tailwindcss init doesn't add the entire library. We can always edit it after development
        - Delete the tailwind.config.js file, and run
        - npm tailwindcss init --full
    * In our postcss.config.js file, we need to tell it to use Tailwindcss
        - let environment = {
            plugins: [
                require("tailwindcss")("./app/javascript/stylesheets/tailwind.config.js"),
                require("postcss-import"),
                require("postcss-flexbugs-fixes"),
                require("postcss-preset-env")({
                    autoprefixer: {
                    flexbox: "no-2009",
                    },
                    stage: 3,
                }),
            ],
        }

        module.exports = environment
    * In our application.html.erb, we need to tell our views to use the stylesheets pack (above the javascript pack_tag)
        - <%= stylesheet_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
    * Now we need to import CSS (Tailwinds)
        - javascript/packs/application.js
            * import "stylesheets/application
Note - Got an error: zsh: no matches found (the head symbol ^ caused the problem). Putting in the back-ticks before the head symbol fixed it.
    - npm install -D tailwindcss@npm:@tailwindcss/postcss7-compat @tailwindcss/postcss7-compat postcss@\^7 autoprefixer@\^9



   