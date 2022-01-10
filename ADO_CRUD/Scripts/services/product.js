

const productService = {

    search: (data) => {

        return new Promise(resolve => {
            $.ajax({
                type: "POST",
                url: "/Product/search",
                data,
                success: (obj) => {
                    resolve(obj);
                }
            });
        });

    },
    save: ( data ) => {

        return new Promise(resolve => {
            $.ajax({
                type: "POST",
                url: "/Product/save",
                data,
                success: (obj) => {
                    resolve(obj);
                }
            });
        });

    },
    edit: (data) => {

        return new Promise(resolve => {
            $.ajax({
                type: "POST",
                url: "/Product/edit",
                data,
                success: (obj) => {
                    resolve(obj);
                }
            });
        });

    },
    delete: (data) => {

        return new Promise(resolve => {
            $.ajax({
                type: "POST",
                url: "/Product/delete",
                data,
                success: (obj) => {
                    resolve(obj);
                }
            });
        });

    }

}