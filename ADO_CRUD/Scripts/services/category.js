

const categoryService = {

    getlist: () => {


        return new Promise(resolve => {
            $.ajax({
                type: "GET",
                url: "/Category/getList",
                success: (obj) => {
                    resolve(obj);
                }
            });
        });

    },
    save: (data) => {

        return new Promise(resolve => {
            $.ajax({
                type: "POST",
                url: "/Category/save",
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
                url: "/Category/edit",
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
                url: "/Category/delete",
                data,
                success: (obj) => {
                    resolve(obj);
                }
            });
        });

    }

}
