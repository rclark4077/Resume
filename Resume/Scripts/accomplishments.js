if (controller === "Projects" || controller === "CareerHistory") {
    ((window) => {
        accomplishments = {
            show: function () {
                const accHeader = document.getElementById("accomplishmentHeader");
                const accContent = document.getElementById("accomplishments");

                const accSourceText = panel2.querySelector("table#tableRow span[data-accomplishmentdescription]");
                const dynamicTextContent = (accSourceText ? accSourceText.dataset.accomplishmentdescription : null);

                // [1] reference modal
                var myModal = document.getElementById('accomplishmentContainer');

                // [2] reference a triggering button (but not used as a trigger)
                //var btnModal = document.getElementById('myModalTrigger');


                // [3] set content (header & content)
                accHeader.textContent = accSourceText.textContent;
                accContent.textContent = dynamicTextContent;

                // [4] initialize with no options provided
                var modalInitJS = new BSN.Modal(myModal);

                // [5] show modal
                modalInitJS.show();
            },
        }
    })(window);
    accomplishments.show();
};
