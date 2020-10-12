const welcomeSpan = document.getElementById("welcomeString");
const welcomeString = "randy.clark\\resume` :) ";
let letters = welcomeString.split("");

//  emulate blinking terminal cursor
if (letters && controller.toLowerCase() == "home") {
    let intervalId = setInterval(function () {
        if (letters.length > 0) {
            let lastLetter = letters.shift();
            let spanChar = document.createElement("SPAN");
            //  set all individual <span>text letters</span> same bg & color
            [].slice.call(welcomeSpan.children).forEach(child => {
                with (child.style) {
                    color = "#f0ffff";
                    backgroundColor = "#343A40";
                };
            });
            //  set only the current newest letter to new color to mimic a typing cursor
            spanChar.textContent = lastLetter;
            with (spanChar.style) {
                color = "#343A40";
                backgroundColor = "#00ffb4";
            };
            welcomeSpan.appendChild(spanChar);
        } else {
            window.clearInterval(intervalId);
            //  mimic keyboard cursor flashing as if ready for input
            let id = window.setInterval(function () {
                let terminalCursor = document.querySelector(".home-render-action table.tableRow:first-child th:first-child h3 span:last-child");
                terminalCursor.style.borderLeft = ((terminalCursor.style.borderLeft == "20px solid rgb(0, 255, 180)")
                    ? "20px solid #343A40"
                    : "20px solid rgb(0, 255, 180)");
            }, 250);
        };
    }, 200);
};

//  remove last list bullet separater symbol
let lastSpan = document.querySelector("div.home-render-action table:nth-child(2) tbody td div span.bullet:last-child");
if (lastSpan) {
    lastSpan.remove();
};

// events
let paragraphTitles = document.querySelectorAll(".paragraph-title");
for (let p = 0; p < paragraphTitles.length; p++) {
    paragraphTitles[p].addEventListener("click", function (e) {
        let title = getTarget(e);
        let grandParent = title.parentNode.parentNode;// represents <td> container
        
        if (title.dataset.noevent != "true") {
            let paragraphs = grandParent.querySelectorAll("div:not(:first-of-type) p");
            //  override if contains <ul> tag
            if (title.textContent.toLowerCase() == "architecture") {
                paragraphs = grandParent.querySelectorAll("div:not(:first-of-type)")
            };
            for (let j = 0; j < paragraphs.length; j++) {
                paragraphs[j].classList.toggle("zoom-text");
            };
        } else {
            let greatGrandParent = grandParent.parentNode.parentNode;
            let paragraphs = greatGrandParent.querySelectorAll("td:not(:first-of-type) div:not(:first-of-type)");

            for (let j = 0; j < paragraphs.length; j++) {
                paragraphs[j].classList.toggle("zoom-text");
            };
        };
    });
};








