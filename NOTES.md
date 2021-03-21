# Project Manager
- Staff_member can create a Project
- Staff_member is the Project_manager of that Project
- On the Projects page, a list of Projects will render
    * If you're the Project_manager, you can assign the project to different staff_memeber(s)
        - Those staff_member(s) then become a team_memeber of that project
# Project   
    - belongs_to_a Team
    - ha_many Developers
# Project_manager
    - has_many Projects
# Developer
    - has_many Projects

3/21/2021 - Avi Project Build
[] Create Project
    () Model
    () Controller
    () View
    () Routes
Note - rails generator resource - Will build a Model, Controller, View and Route resources

   