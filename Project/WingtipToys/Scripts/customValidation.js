(function ($) {
    if (window.ValidatorUpdateDisplay) {
        var proxied = window.ValidatorUpdateDisplay;

        window.ValidatorUpdateDisplay = function () {
            var result = proxied.apply(this, arguments);

            onAfter(arguments);

            return result;
        };

        var onAfter = function (arguments) {
            var errorSpan = arguments[0],
                control = document.getElementById(errorSpan.controltovalidate)
            validators = control.Validators,
            isValid = true,
            oldDescrybedByVal = $(control).attr("aria-describedby") || "";

            if (errorSpan.isvalid) {
                $(control).attr("aria-invalid", false);
                $(control).attr("aria-describedby", oldDescrybedByVal.replace(" " + errorSpan.id, ""));
            }
            else {
                if (oldDescrybedByVal.indexOf(" " + errorSpan.id) === -1)
                    $(control).attr("aria-describedby", oldDescrybedByVal + " " + errorSpan.id);

                $(errorSpan).attr("aria-hidden", false);
            }
        };
    }
})(jQuery);