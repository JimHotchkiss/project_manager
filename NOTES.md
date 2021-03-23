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
    () Strong params 
    () Create method
    () Show view 
        () @project variable is showing up nil, on the Project show page. View is rendering though.
            - Note: The new method reroutes to the show method. There you'll search for the instance with .find(params[:id]). Show method implicitly reroutes to the show view
    () Form validations
    () URL - projects/new
        - This is handled by Rails resources 
Note - in app/javascript/stylesheets/tailwind.config.js, I changed the transition default time from 150ms to 300ms
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



   