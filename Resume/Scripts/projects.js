//  ------------------------------------------------------------------------------------------ [ View: Index ]
(function (window) {
    window.PROJECTS = {
        /**
         * @description: row arrow selector
         * @param: {HTMLTableHeaderCellElement}
         * @param: {HTMLTableRowElement}
         * @returns: {null}
         **/
        focusArrow: (header, rows) => {
            let icon;
            if (header && header.querySelector("i")) {
                icon = header.querySelector("i");
            } else {
                [...rows].map(r => {
                    let td = r.querySelector("td");
                    if (td.querySelector("i")) {
                        icon = td.querySelector("i");
                    };
                });
            };
            [...rows].map(row => {
                row.addEventListener("click", function () {
                    let td = row.querySelectorAll("td")[0];
                    td.appendChild(icon);
                });
            });
        }
    }
})(window);