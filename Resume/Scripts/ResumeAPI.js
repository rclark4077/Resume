﻿//  ------------------------------------------------------------------------ [Global Immutables as primitives]
const navTextContent = [];
const card = document.getElementById("contentPanel");
const cardBody = card.querySelector(".body");
const panel2 = document.getElementById("section-2");
const tableSpan = panel2.querySelectorAll("div#contentPanel .body .company-list table td span");
const tr = cardBody.querySelectorAll("table table tbody tr");
//  ------------------------------------------------------------------------ [Begin Site Javascript Module API]
(function (window) {
    window.TARGET = {
        /**
         * @description - Returns target object in usable dom reference
         * @param {any} e
         * @returns {Node}
         */
        getTarget: function (e) {
            ev = e || window.event;             // ie8 legacy object
            return ev.target || ev.srcElement;  // ie8 legacy object
        },
    },
    window.PAGE = {
        /**
        * @description - Displays or removes content panel minification button
        * @param {string}
        * @param {HTMLFontElement}
        * @returns {boolean}
        */
        toggler: (controllerName, toggle) => {
            //  [show/hide content panel minification button]
            let removed = false;

            switch (controllerName) {
                case 'home':
                    toggle.remove();
                    removed = true;
                    break;
                default:
                    card.insertBefore(toggle, card.children[0]);
                    break;
            }
            return removed;
        },
        /**
        * @description - Adds event listener if !toggleRemove()
        * @param {boolean}
        * @param {HTMLFontElement}
        * @returns {null}
        */         
        togglerListen: (buttonRemoved, toggler) => {
            if (!buttonRemoved && toggler) {
                toggler.addEventListener("click", e => {
                    with (TARGET.getTarget(e)) {
                        textContent = classList.contains("md-brightgreen") ? "toggle_on" : "toggle_off";
                        title = classList.contains("md-brightgreen") ? "Hide" : "Show";
                        classList.toggle("md-brightgreen");
                    };
                    cardBody.classList.toggle('collapsible');
                });
            };
        },
        /**
        * @description - Zoom-in text buttons event listeners
        * @param {HTMLTableRowElement}
        * @return {null}
        */
        zoomify: tr => {
            [...tr].map(function (row) {
                let zoomIcon = row.querySelectorAll("span.paragraph-title");
                [...zoomIcon].map(function (zoom) {
                    if (zoom) {
                        zoom.addEventListener("click", function () {
                            //  when zoom button is clicked, zoom in entire <td> textContent
                            if (zoom.textContent == "zoom" || zoom.textContent == "normalize") {
                                try {
                                    let zoomTd = zoom.parentNode.parentNode;
                                    zoomTd.classList.toggle("zoom-text");
                                    zoomTd.nextElementSibling.classList.toggle("zoom-text");
                                } catch (e) {
                                    let err = e.message;
                                };
                                let buttonTextValue = (el => {
                                    return el.textContent == "zoom" ? "normalize" : "zoom";
                                });
                                zoom.textContent = buttonTextValue(this);
                            };
                            zoom.classList.toggle("paragraph-title-click");
                        });
                    };
                });
            });
        },
        /**
        * @description - Strips and returns hyperlink embedded in element's data-link attrib
        * @param {any}
        * @returns {null}
        */
        getHyperLink: el => {
            if (el.dataset.link) {
                let controllerAction = el.dataset.link.split("/").filter(tag => {
                    return tag != null && tag != '';
                });
                return controllerAction;
            } else {
                return null;
            };
        },
        /**
        * @description - Submits or hyperlinks based on asp.net controller source
        * @param {any}
        * @returns {null}
        */
        submit: function (el) {
            if (el.dataset.link) {
                let split = PAGE.getHyperLink(el);
                document.getElementById("Controller").value = split[0];
                document.getElementById("Action").value = split[1];
                document.getElementById("Param").value = split[2];

                //  use this control flow to ensure certain embedded child pages behave accordingly
                switch (split[0]) {
                    case "Projects":
                        document.getElementById("ProjectId").value = el.dataset.projectid;
                        let form = document.forms[0];
                        form.submit();
                        break;
                    case "Home":
                    case "Qualifications":
                    case "Education":
                    case "Profile":
                    default:
                        location.href = el.dataset.link;
                        break;
                };
            };
        }
    },
    window.NAV = {
        /**
        * @desc - Set each listed nav link's title to the textContent property
        * @param {HTMLUListElement} - Navigation top-level <ul> container
        * @returns {null}
        */
        cloneNavText: ul => {
            for (let i = 0; i < ul.children.length; i++) {
                navTextContent.push(ul.children[i].querySelector("li > span").textContent);
                ul.children[i].title = ul.children[i].querySelector("li > span").textContent;
            };
        },
        /**
        * @description - Remove the data-link attribute from grandparent (ie: <li data-link>) if a <span data-link> submodule button exists
        * @param {HTMLUListElement} - Navigation top-level <ul> container
        * @returns {null}
        */  
        removeModuleLevelDataLink: ul => {
            [].slice.call(ul.children).forEach(li => {
                const span = li.querySelectorAll("div span[data-link]");
                [...span].map(s => {
                    s.parentNode.parentNode.removeAttribute("data-link");
                });
            });
        },
        /**
        * @description - Sets up side navigation characteristics and event listeners
        * @param {HTMLUListElement} - Navigation top-level <ul> container
        * @returns {null}
        */
        navListen: (ul) => {
            [].slice.call(ul.children).forEach(li => {
                const panel1 = document.getElementById("section-1");
                const tooltip = document.querySelector('#tooltip');
                const attrib1 = document.createAttribute("aria-describedby");
                const black = "md-black";
                const mint = "md-mint";
                const openNavPanel = function (menuItem) {
                    const navExpand = 215;// used for stretching sibling panel as navbar is activated
                    const panel1 = document.getElementById("section-1");
                    const ul = document.querySelector("section#section-1 ul");
                    const spanTextContent = ul.querySelectorAll("li > span");
                    let i = 0;// iterator
                    //  establish initial panel2 (aka content panel) size
                    with (panel2.style) {
                        if (width == '') {
                            width = panel2.offsetWidth + "px";
                            left = "0px";
                        };
                    };
                    // toggle expand/contract navigation panel
                    if (panel1.classList.contains("nav-panel-expanded")) {// then we need to shrink nav panel
                        panel1.style.width = "60px";
                        with (panel2.style) {
                            width = parseInt(width.replace('px', '')) + navExpand + 'px';
                            left = parseInt(left.replace('px', '')) - navExpand + 'px';
                        };
                        panel1.classList.remove("nav-panel-expanded");
                    } else {// then we need to expand nav panel
                        panel1.style.width = "275px";
                        with (panel2.style) {
                            width = parseInt(width.replace('px', '')) - navExpand + 'px';
                            left = parseInt(left.replace('px', '')) + navExpand + 'px';
                        };
                        panel1.classList.add("nav-panel-expanded");
                    };
                    //  hide nav icons' texts
                    [...spanTextContent].map(s => {
                        if (panel1.classList.contains("nav-panel-expanded")) {
                            s.textContent = navTextContent[i];
                        } else {
                            s.textContent = null;
                        };
                        i += 1;
                    });
                };
                const clearAllActive = function (el) {
                    // remove any .active class from all <li> items' table rows' table cells
                    for (let i = 0; i < el.children.length; i++) {
                        let l = el.children[i];
                        l.classList.remove("active");
                        let childDivs = l.querySelectorAll("div");

                        [...childDivs].map(c => {
                            c.classList.add("display-block");
                        });
                    };
                };
                const bgColor = function (el, direction) {
                    if (direction == 'hover') {
                        //  accent bgColor for menu item hover
                        with (el.style) {
                            color = "#101010";
                            backgroundColor = "#cffdec";
                        };
                    } else {
                        with (el.style) {
                            color = "#cffdec";
                            backgroundColor = "#101010";
                        };
                    };
                };

                //  level-1 icon mouseover/out/click navigation show/hide panel even listeners
                let i = 0;
                attrib1.value = "tooltip";

                li.addEventListener("mouseover", e => {
                    //  if compressed, show menu popcorn title
                    if (!panel1.classList.contains("nav-panel-expanded")) {
                        li.setAttributeNode(attrib1);
                        tooltip.style.display = "block";
                        tooltip.textContent = li.title;

                        Popper.createPopper(li, tooltip, {
                            placement: 'right',
                        });
                    };
                    //  accent bgColor for menu item hover
                    if (li.title != 'navigate') {
                        bgColor(li, 'hover');
                        bgColor(li.querySelector("span"), 'hover');
                        //  update nav menu icon state
                        with (li.querySelector("i").classList) {
                            remove(mint);
                            add(black);
                        };
                    };
                });
                li.addEventListener("mouseout", e => {
                    //  normalize bgColor for menu item hover
                    if (li.title != 'navigate') {
                        bgColor(li, 'out');
                        bgColor(li.querySelector("span"), 'out');
                    };
                    //  if expanded, suppress menu popcorn title
                    tooltip.style.display = "none";
                    //  update nav menu icon state
                    if (li.title != 'navigate') {
                        with (li.querySelector("i").classList) {
                            remove(black);
                            add(mint);
                        };
                    };
                });
                li.addEventListener("click", e => {
                    //  remove tooltip
                    tooltip.style.display = "none";

                    // clear .active to all <li> elmenets by sending its parent <ul> to loop the changes
                    clearAllActive(li.parentNode);

                    //  which menu navigation list item was clicked?
                    if (li == ul.children[i]) {// if navigate button was clicked, then toggle expanded class
                        openNavPanel(li);
                    } else {// all other listbuttons
                        //  open navigation panel
                        if (!panel1.classList.contains("nav-panel-expanded")) {
                            openNavPanel(li);
                        };

                        //  toggle active flag on menu list item selected
                        li.classList.add("active");

                        //  setup <div data-link="..."> click event listener to trip submodule_display_none flags
                        //let div = li.querySelectorAll("div");
                        [...li.querySelectorAll("div")].map(div => {
                            with (div.style) {
                                div.classList.remove("display-block");
                            };
                            let span = div.querySelector("span");
                            span.addEventListener("click", e => {
                                //  submit form selection --> this form will remember which menu/submenu was selected past a post() event
                                PAGE.submit(span);
                            });
                        });
                    };
                    //  submit form selection --> this form will remember which menu/submenu was selected past a post() event
                    if (li.dataset.link) {
                        PAGE.submit(li);
                    };
                });// li.click
            });// foreach ul
        },
    },
    window.COMPANYHISTORY = {
        /**
        * @description - Company selection click events
        * @param {HTMLSpanElement}
        * @returns {null}
        */
        companyHistoryListen: tableSpan => {
            [...tableSpan].map(span => {
                span.addEventListener("click", e => {
                    let s = TARGET.getTarget(e);
                    PAGE.submit(s);
                });
            });
        },
    }
})(window);
document.onreadystatechange = function () {
    switch (document.readyState) {
        case 'complete':
            // COMPANYHISTORY [company history objects]
            COMPANYHISTORY.companyHistoryListen(panel2.querySelectorAll("div#contentPanel .body .company-list table td span"));

            // NAV [navigation | menu objects]
            NAV.cloneNavText(document.querySelector("section#section-1 ul"));
            NAV.removeModuleLevelDataLink(document.querySelector("section#section-1 ul"));
            NAV.navListen(document.querySelector("section#section-1 ul"));

            // PAGE [Miscellaneous page content objects]
            let toggleRemoved = PAGE.toggler(controller.trim().toLowerCase(), panel2.querySelector(".container i#flexIcon"));
            PAGE.togglerListen(toggleRemoved, panel2.querySelector("#flexIcon"));
            PAGE.zoomify(tr);

            // PROJECTS [these objects are set in /Scripts/projects.js]
            PROJECTS.focusArrow(document.querySelector("#section-2 .body .projects-list .embedded-thead tr th")
                                , document.querySelectorAll("#section-2 .body .projects-list table tbody table tr"));

            // TERMINAL [these objects are set in /Scripts/homeProfile.js]
            TERMINAL.typeMessage(document.getElementById("welcomeString"), "randy.clark\\resume` :) ");
            TERMINAL.removeLastPipe(document.querySelector("div.home-render-action table:nth-child(1) tbody td span.bullet:last-child"));
            TERMINAL.zoomsections(document.querySelectorAll(".paragraph-title"));
            //TERMINAL.displayTables(document.querySelectorAll(".home-render-action table.tableRow:nth-child(3) td:nth-child(2).architecture table th p"));
            TERMINAL.displayTables(document.querySelectorAll(".home-render-action table.tableRow:nth-child(3) td table th p"));

            // ACCOMPLISHMENTS [these objects are set in /Scripts/accomplishments.js]
            if (controller === "Projects" || controller === "CareerHistory") {
                ACCOMPLISHMENTS.show();
            }

            break;
    };
};

