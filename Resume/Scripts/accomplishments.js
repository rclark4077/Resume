const accSourceText = panel2.querySelector("table#tableRow span[data-accomplishmentdescription]");
const dynamicTextContent = (accSourceText ? accSourceText.dataset.accomplishmentdescription : null);
//  ------------------------------------------------------------------------------------------ [ Main() ]
if (dynamicTextContent != null) {// suppress all windows except for those menus have submodules (ie: professional history && projects)
    const accContainer  = document.getElementById("accomplishmentContainer");
    const accImage      = document.getElementById("accomplishmentMinMax");
    const accContent    = document.getElementById("accomplishments");

    //  window dimensions
    const w_w = window.innerWidth;
    const w_h = window.innerHeight;

    //  view port dimensions
    let acc_w = accContent.clientWidth;
    let acc_h = accContent.clientHeight;// change this value to popup/compress notification panel height

    let stop_position_x = ((w_w - acc_w) / 2);
    let stop_position_y = 0; // original: w_h - (acc_h/2 + 20); <<< leave this in case changes later

    const defaultTextContent = null;
    let displayFlag = true;

    //const defaultTextContent = "Contact Information";
    function popUp(el) {
        with (el.style) {
            left = stop_position_x + "px";
            top = stop_position_y + "px";
        };
    };
    function panelMinMax(status, callback = null) {
        popUp(accContainer);
        switch (status) {
            case "show":
                if (displayFlag) {
                    accContent.textContent = dynamicTextContent;
                    with (accContainer.style) {
                        opacity = "1";
                    };
                    displayFlag = false;
                };
                break;
            case "hide":
                accContent.textContent = defaultTextContent;
                with (accContainer.style) {
                    opacity = "0.75";
                    top = "-" + acc_h + "px";
                };
                displayFlag = true;
                break;
        };
        if (callback) {
            callback();
        };
    };
    function setEvents(el) {
        switch (el.id) {
            case "accomplishmentContainer":
                el.addEventListener("mouseover", () => {
                    panelMinMax("show");
                    displayFlag = true;
                });
            case "accomplishmentMinMax":
                el.addEventListener("click", () => {
                    if (displayFlag) {
                        panelMinMax("show", () => {
                            setTimeout(function () {
                                panelMinMax("hide");
                            }, 5000);
                        });
                    } else {
                        panelMinMax("hide");
                    };
                });
                break;
            default: // use this for window or document level DOM events/property settings
                window.addEventListener("resize", function () {
                    if (displayFlag) {
                        panelMinMax("show")
                    } else {
                        panelMinMax("hide")
                    };
                    //popUp(accContainer);
                });
                break;
        };
    };
    setEvents(accContainer);
    setEvents(accImage);
    setEvents(window);
    ((accContainer, accContent) => {
        panelMinMax("show", function () {
            setTimeout(function () {
                panelMinMax("hide");
            }, 5000);
        });
    })(accContainer, accContent);
}

