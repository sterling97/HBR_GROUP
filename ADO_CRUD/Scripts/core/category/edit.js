
/*
    
    CORE FOR CATEGORY
    
 */

//Events

$("#save").on("click", () => {

    if (!$("form").valid()) {
        return;
    }

    categoryService.edit({
        Id: parseInt($("#Id").val()),
        Name: $("#Name").val()
    })
        .then((obj) => {

            if (obj) {
                window.location.href = "/Category";
            } else {
                alert("Ocurrio algun error.");
            }
        });

});