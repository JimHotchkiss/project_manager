const collapseEventListener = () => {
  const button = document.getElementById("button")
  const projectShowDiv = document.getElementById("project-show-div")
  button.addEventListener("click", () => {
    if (projectShowDiv.classList.contains("max-h-32")) {
      projectShowDiv.classList.remove("max-h-32")
      projectShowDiv.classList.remove("overflow-hidden")
      projectShowDiv.classList.remove("overflow-scroll")
      button.innerText = "Show less"
    } else {
      projectShowDiv.classList.add("max-h-32")
      projectShowDiv.classList.add("overflow-hidden")
      projectShowDiv.classList.add("overflow-scroll")
      button.innerText = "Show more"
    }
  })
}

collapseEventListener()
