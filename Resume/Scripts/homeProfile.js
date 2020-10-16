(function (window) {
    window.terminal = {
        /**
		 * Emulate blinking terminal cursor
         * typing welcome string
        **/
        hello: function (welcome, welcomeString, controller) {
            let letters = welcomeString.split("");
            if (letters.length > 0) {
                let intervalId = setInterval(function () {
                    if (letters.length > 0) {
                        let lastLetter = letters.shift();
                        let spanChar = document.createElement("SPAN");
                        //  set all individual <span>text letters</span> same bg & color
                        [].slice.call(welcome.children).forEach(child => {
                            with (child.style) {
                                color = "#000";
                                backgroundColor = "#00ffb4";
                            };
                        });
                        //  set only the current newest letter to new color to mimic a typing cursor
                        spanChar.textContent = lastLetter;
                        with (spanChar.style) {
                            backgroundColor = "#000";
                            color = "#00ffb4";
                        };
                        welcome.appendChild(spanChar);
                    } else {
                        window.clearInterval(intervalId);
                        //  mimic keyboard cursor flashing as if ready for input
                        let id = window.setInterval(function () {
                            let terminalCursor = document.querySelector(".socialnetworks table.tableRow:first-child th:first-child p span:last-child");
                            with (terminalCursor.style) {
                                borderLeft = ((borderLeft ==  "15px solid rgb(0, 255, 180)")
                                                            ? "15px solid #000"
                                                            : "15px solid rgb(0, 255, 180)");
                            }
                        }, 250);
                    };
                }, 200);
            };
        },
        /**
         * Removes the final '|' char
         * from string
         **/
        removepipe: function (lastSpan) {
            lastSpan ? lastSpan.remove() : null;
        },
        /**
         * Sets addEventListeners for any dom element children as function parameter
         **/
        zoomsections: function (paragraphTitles) {
            for (let p = 0; p < paragraphTitles.length; p++) {
                if (!paragraphTitles[p].classList.contains("noevent")) {
                    paragraphTitles[p].addEventListener("click", function (e) {
                        let title = getTarget(e);//<span>
                        let grandParent = title.parentNode.parentNode;// represents grandparnet <td> container of previous <span>


                        let paragraphs = grandParent.querySelectorAll("div:not(:first-of-type) p");
                        if (title.textContent.toLowerCase() == "architecture") {
                            paragraphs = grandParent.querySelectorAll("div:not(:first-of-type) table")
                        };
                        for (let j = 0; j < paragraphs.length; j++) {
                            paragraphs[j].classList.toggle("zoom-text");
                        };
                    });
                };
            };
        },
        /**
         * Sets event listeners on tables to be displayed
         **/
        displaytables: function (spantags) {
            for (s = 0; s < spantags.length; s++) {
                let span = spantags[s];
                span.addEventListener("click", () => {
                    let table = span.parentNode.parentNode.parentNode.parentNode;
                    let tbody = table.children[1];//[1] = <tbody>  while [0] = <thead>
                    tbody.classList.toggle("display-table");
                });
            }
        }
    }
})(window);
document.onreadystatechange = function () {
    switch (document.readyState) {
        case "complete":
            terminal.hello(document.getElementById("welcomeString"), "randy.clark\\resume` :) ", controller);
            terminal.removepipe(document.querySelector("div.socialnetworks table:nth-child(2) tbody td span.bullet:last-child"));
            terminal.zoomsections(document.querySelectorAll(".paragraph-title"));
            terminal.displaytables(document.querySelectorAll(".home-render-action table.tableRow:nth-child(3) td table th span"));
            break;
    }
};

