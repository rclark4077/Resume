(function (window) {
    window.TERMINAL = {
        /**
         * @description - Emulate blinking terminal cursor
         * @param {HTMLParagraphElement}
         * @param {string}
         * @returns {null}
         */
        typeMessage: (el, welcomeString) => {
            letters = welcomeString.split("");
            if (letters.length > 0) {
                let intervalId = setInterval(function () {
                    if (letters.length > 0) {
                        let lastLetter = letters.shift();
                        let spanChar = document.createElement("SPAN");
                        //  set all individual <span>text letters</span> same bg & color
                        [].slice.call(el.children).forEach(child => {
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
                        el.appendChild(spanChar);
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
         * @description - Removes the final '|' char in html string row
         * @param {HTMLSpanElement}
         * @returns {null}
         */
        removeLastPipe: lastSpan => {
            lastSpan ? lastSpan.remove() : null;
        },
        /**
         * @description - Sets addEventListeners for any dom element children as function parameter
         * @param {CSSRule}
         * @returns {null}
         */
        zoomsections: paragraphTitles => {
            [...paragraphTitles].map(p => {
                if (!p.classList.contains("noevent")) {
                    p.addEventListener("click", function (e) {
                        let title = TARGET.getTarget(e);//<span>
                        let grandParent = title.parentNode.parentNode;// represents grandparnet <td> container of previous <span>

                        let paragraphs = grandParent.querySelectorAll("div:not(:first-of-type) p");
                        if (title.textContent.toLowerCase() == "architecture") {
                            paragraphs = grandParent.querySelectorAll("div:not(:first-of-type) table")
                        };
                        [...paragraphs].map(p => {
                            p.classList.toggle("zoom-text");
                        });
                    });
                };
            });
        },
        /**
         * @description - Sets event listeners on tables to be displayed
         * @param {HTMLSpanElement}
         * @returns {null}
         */
        displayTables: els => {
            [...els].map(el => {
                let span = el;
                span.addEventListener("click", () => {
                    span.classList.toggle("text-Highlight");
                    let table = span.parentNode.parentNode.parentNode.parentNode;
                    let tbody = table.children[1];//[1] = <tbody>  while [0] = <thead>
                    tbody.classList.toggle("display-table");
                });
            });
        }
    }
})(window);