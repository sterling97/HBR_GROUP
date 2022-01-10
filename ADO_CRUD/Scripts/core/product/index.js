
//variables

let timeout = null;

function RedirectSearch() {

    const value = $(this).data("id");

    window.location = `/Product/DetailsProduct/${value}`;
}


function search(el) {

    const val = $(el).val();

    clearTimeout(timeout);

    timeout = setTimeout(() => {

        productService.search({ keyword: val })
            .then((obj) => {

                const box = $("#result-search");
                const elem_each = $("#element-each").html("");

                obj.forEach((itm) => {

                    box.append(
                        elem_each
                            .append(
                                $("<li>").html(itm.Name).data("id", itm.ID).click(RedirectSearch))
                    )
                });
            });

    }, 500);
}

//Events

$(document).ready(() => {


    $(".btn-delete").on("click", function () {

        const ID = $(this).data("id");

        if (!confirm("Are you sure?")) {
            return;
        }

        productService.delete({
            ID: parseInt(ID)
        })
            .then((obj) => {

                if (obj) {
                    alert("Product deleted");
                    window.location.reload(true);
                } else {
                    alert("Ocurrio algun error.");
                }
            });

    });

});
