const wordshow = () => {
  const wordMemory = document.querySelector(".word-memory")
  const wordName = document.getElementById("word-name")
  const wordMean = document.getElementById("word-mean")

  function transition() {
    if (this.className == "word-memory active"){
      this.className = "word-memory"
    } else {
      this.className = "word-memory active"
    }
  }

  wordMemory.addEventListener("click" , transition)
  // wordMean.addEventListener("click" , transition)
  // wordName.addEventListener("click", (e)=> {
    // const back = document.getElementById("word-mean");
    // wordName.style.transition = "1s";
    // wordName.style.transform = "rotateY(180deg)";
    // wordName.addEventListener("transitionstart",() => {
    //   wordName.style.display = "none"
    //   back.style.display = "block"
      
    // })
    // back.style.display = "block"
    // const showDisplay = function(){
    //   wordName.style.display = "none"
    //   back.style.display = "block"
    // }
    // setTimeout(showDisplay, 1000);
    // console.log("成功")
  // })
};

window.addEventListener("load", wordshow);