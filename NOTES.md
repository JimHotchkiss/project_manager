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




3/21/2021 - Avi Project Build
[] Create Project
    () Model
        - Name 
        - Number_of_developers
        - Description
    () Controller
    () View
    () Routes
Note - rails generator resource - Will build a Model, Controller, View and Route resources

   