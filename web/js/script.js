var l = document.getElementsByClassName("cancel");
for (var i = 0; i < l.length; i++)
{
    document.getElementsByClassName("cancel")[i].addEventListener("click", (event) => {
        event.target.parentNode.style.display = "none";
    });

}
