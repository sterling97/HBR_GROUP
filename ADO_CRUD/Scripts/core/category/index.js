
//Events

$(document).ready(() => {

    $('table').DataTable();


    $(".btn-delete").on("click", function () {

        const ID = $(this).data("id");

        if (!confirm("Are you sure?")) {
            return;
        }

        categoryService.delete({
            ID: parseInt(ID)
        })
            .then((obj) => {

                if (obj) {
                    alert("Category deleted");
                    window.location.reload(true);
                } else {
                    alert("Ocurrio algun error.");
                }
            });

    });

});
