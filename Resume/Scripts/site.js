////////////////////////////////////////////////////
////////////////////////////////////////////////////                         [Globals]
////////////////////////////////////////////////////
//  ------------------------------------------------------------------------ [Global vars]
const navTextContent = [];
const card = document.getElementById("contentPanel");
const cardBody = card.querySelector(".body");
const panel2 = document.getElementById("section-2");
const btnBodyContentToggle = panel2.querySelector(".container i#flexIcon");
const tableSpan = panel2.querySelectorAll("div#contentPanel .body .company-list table td span");
const tr = cardBody.querySelectorAll("table table tbody tr");
//  ------------------------------------------------------------------------ [Global functions]
function getTarget(e) {
    ev = e || window.event;             // ie8 legacy object
    return ev.target || ev.srcElement;  // ie8 legacy object
};
function openNavPanel(menuItem) {
    const navExpand         = 215;// used for stretching sibling panel as navbar is activated
    const panel1            = document.getElementById("section-1");
    const ul                = document.querySelector("section#section-1 ul");
    const spanTextContent   = ul.querySelectorAll("li > span");
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
    for (let i = 0; i < spanTextContent.length; i++) {
        if (panel1.classList.contains("nav-panel-expanded")) {
            spanTextContent[i].textContent = navTextContent[i];
        } else {
            spanTextContent[i].textContent = null;
        };
    };
};
function clearAllActive(el) {
    // remove any .active class from all <li> items' table rows' table cells
    for (let i = 0; i < el.children.length; i++) {
        let l = el.children[i];
        l.classList.remove("active");
        let childDivs = l.querySelectorAll("div");
        for (let i = 0; i < childDivs.length; i++) {
            childDivs[i].classList.add("display-block");
        };
    };
};
function bgColor(el, direction) {
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
function getHyperLink(el = null) {
    if (el.dataset.link) {
        let controllerAction = el.dataset.link.split("/").filter(tag => {
            return tag != null && tag != '';
        });
        return controllerAction;
    } else {
        return null;
    };
};
function submit(el) {
    if (el.dataset.link) {
        let split = getHyperLink(el);
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
};
//  ------------------------------------------------------------------------ [Global Content Panel Items]
//  [show/hide content panel minification button]
switch (controller.trim().toLowerCase()) {
    case "home":
        btnBodyContentToggle.remove();
        break;
    default:
        card.insertBefore(btnBodyContentToggle, card.children[0]);
        break;
};
//  [display/collapse content panel in main content body]
btnBodyContentToggle.addEventListener("click", e => {
    with (getTarget(e)) {
        textContent = classList.contains("md-brightgreen") ? "toggle_on" : "toggle_off";
        title = classList.contains("md-brightgreen") ? "Hide" : "Show";
        classList.toggle("md-brightgreen");
    };
    cardBody.classList.toggle('collapsible');
});
//  [content panel 2: company header click events]
for (let i = 0; i < tableSpan.length; i++) {
    tableSpan[i].addEventListener("click", e => {
        let span = getTarget(e);
        submit(span);
    });
};

//  [all zoom-in text buttons click events]
for (let r = 0; r < tr.length; r++) {
    let zoomIcon = tr[r].querySelectorAll(".paragraph-title");
    for (let z = 0; z < zoomIcon.length; z++) {
        if (zoomIcon[z]) {
            zoomIcon[z].addEventListener("click", function () {
                //  when zoom button is clicked, zoom in entire <td> textContent
                if (zoomIcon[z].textContent == "zoom" || zoomIcon[z].textContent == "normalize") {
                    try {
                        let zoomTd = zoomIcon[z].parentNode.parentNode;
                        zoomTd.classList.toggle("zoom-text");
                        zoomTd.nextElementSibling.classList.toggle("zoom-text");
                    } catch (e) {
                        let err = e.message;
                    };
                    let buttonTextValue = (el => {
                        return el.textContent == "zoom" ? "normalize" : "zoom";
                    });
                    zoomIcon[z].textContent = buttonTextValue(this);
                };
                zoomIcon[z].classList.toggle("paragraph-title-click");
            });
        };
    };
};
////////////////////////////////////////////////////
////////////////////////////////////////////////////
////////////////////////////////////////////////////                         [begin main(ul)() iffe]
////////////////////////////////////////////////////
////////////////////////////////////////////////////
(ul => {// aka function main(string args[])
    //  [1] set each listed nav link's title to the textContent property
    for (let i = 0; i < ul.children.length; i++) {
        if (i == 0) {
            window.addEventListener("mousewheel", () => {
                openNavPanel(li);
            });
        };
        navTextContent.push(ul.children[i].querySelector("li > span").textContent);
        ul.children[i].title = ul.children[i].querySelector("li > span").textContent;
    };

    //  [2] remove all module-level [data-link] attribute from li if submodule has div[data-link]
    [].slice.call(ul.children).forEach(li => {
        const panel1    = document.getElementById("section-1");
        const tooltip   = document.querySelector('#tooltip');
        const attrib1   = document.createAttribute("aria-describedby");
        const span      = li.querySelectorAll("div span[data-link]");
        const black     = "md-black";
        const mint      = "md-mint";

        //  if a <span data-link> submodule button exists, then remove the data-link attribute from grandparent (ie: <li data-link>)
        for (let i = 0; i < span.length; i++) {
            span[i].parentNode.parentNode.removeAttribute("data-link");
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
                let div = li.querySelectorAll("div");
                for (let i = 0; i < div.length; i++) {
                    with (div[i].style) {
                        div[i].classList.remove("display-block");
                    };
                    let span = div[i].querySelector("span");
                    span.addEventListener("click", e => {
                        //  submit form selection --> this form will remember which menu/submenu was selected past a post() event
                        submit(span);
                    });
                };
            };
            //  submit form selection --> this form will remember which menu/submenu was selected past a post() event
            if (li.dataset.link) {
                submit(li);
            };
        });// li.click
    });//   foreach ul
})(document.querySelector("section#section-1 ul"));
