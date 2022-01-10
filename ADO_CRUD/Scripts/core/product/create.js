
    /*
        
        CORE FOR PRODUCT
        
     */

    //show category list
    categoryService.getlist().then((obj) => {

        obj.forEach(({ Name, Id }) => {
            $("#ID_Category").append($("<option>").html(Name).val(Id));
        })

    });


    //Events

$("#save").on("click", () => {

    if (!$("form").valid()) {
        return;
    }

        productService.save( {
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

