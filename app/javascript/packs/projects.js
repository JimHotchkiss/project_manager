const collapseEventListener = () => {
  const button = document.getElementById("button")
  const projectShowDiv = document.getElementById("project-show-div")
  if (button) {
    button.addEventListener("click", () => {
      if (projectShowDiv.classList.contains("max-h-32")) {
        projectShowDiv.classList.remove("max-h-32")
        projectShowDiv.classList.remove("overflow-hidden")
        projectShowDiv.classList.remove("overflow-scroll")
        button.innerHTML = "<i class='fas fa-chevron-up'></i>"

        //   button.innerText = "Show less"
      } else {
        projectShowDiv.classList.add("max-h-32")
        projectShowDiv.classList.add("overflow-hidden")
        projectShowDiv.classList.add("overflow-scroll")
        button.innerHTML = "<i class='fas fa-chevron-down'></i>"
      }
    })
  }
}

collapseEventListener()
