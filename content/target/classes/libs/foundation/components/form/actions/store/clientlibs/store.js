(function (document, $) {
    $(document).on("foundation-contentloaded", function (e) {
        $('.js-store-view-data').on('click', function (e) {
            window.open(Granite.HTTP.externalize($(".js-store-path").val() + ".json"), "FormReport");
        });
    });
})(document, Granite.$);