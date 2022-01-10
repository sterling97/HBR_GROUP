
/*
    
    CORE FOR PRODUCT
    
 */

//show category list
categoryService.getlist().then((obj) => {

    const _ID_Category = parseInt( $("#_ID_CATEGORY").val() );

    obj.forEach(({ Name, Id }) => {
        $("#ID_Category").append($("<option>").html(Name).val(Id).attr(_ID_Category == Id ? "selected" : "data-val", ""));
    });

});


//Events

$("#save").on("click", () => {

    if (!$("form").valid()) {
        return;
    }

    productService.edit({
        ID: parseInt( $("#ID").val() ),
        Name: $("#Name").val(),
        Description: $("#Description").val(),
        URL_IMG: $("#URL_IMG").val(),
        ID_Category: parseInt($("#ID_Category").val())
    })
    .then((obj) => {

        if (obj) {
            window.location.href = "/Product";
        } else {
            alert("Ocurrio algun error.");
        }
    });

});

