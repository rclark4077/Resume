//  ------------------------------------------------------------------------------------------ [ View: Index ]
((header, rows) => {
    let icon;
    if (header && header.querySelector("i")) {
        icon = header.querySelector("i");
    } else {
        for (let i = 0; i < rows.length; i++) {
            let td = rows[i].querySelector("td");
            if (td.querySelector("i")) {
                icon = td.querySelector("i");
            };
        };
    };
    for (let i = 0; i < rows.length; i++) {
        rows[i].addEventListener("click", function () {
            let td = rows[i].querySelectorAll("td")[0];
            td.appendChild(icon)
        });
    };
})(document.querySelector("#section-2 .body .projects-list .embedded-thead tr th")
    , document.querySelectorAll("#section-2 .body .projects-list table tbody table tr"));