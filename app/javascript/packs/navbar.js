// window.addEventListener("load", () => {
//   menuEventListener()
// })

const menuEventListener = () => {
  const menu = document.getElementById("menu")
  const top = document.getElementById("top")
  const middle = document.getElementById("middle")
  const nav = document.getElementById("nav")
  menu.addEventListener("click", () => {
    if (top.classList[1] === "w-3") {
      console.log(top.classList[1] === "w-3")
      top.classList.replace("w-3", "w-7")
      top.classList.add("transition-all")
      middle.classList.replace("w-5", "w-7")
      middle.classList.add("transition-all")
      nav.classList.replace("h-12", "h-40")
    } else {
      console.log(top.classList[1] === "w-3")
      top.classList.replace("w-7", "w-3")
      middle.classList.replace("w-7", "w-5")
      nav.classList.replace("h-40", "h-12")
    }
  })
}

menuEventListener()
