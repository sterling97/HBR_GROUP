
    /*
        
        CORE FOR CATEGORY
        
     */


    //Events

$("#save").on("click", () => {

    if (!$("form").valid()) {
        return;
    }

    categoryService.save({
            Id: 0,
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

