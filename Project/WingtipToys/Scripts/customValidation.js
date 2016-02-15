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
                var newMessage = oldDescrybedByVal.replace(" " + errorSpan.id, "");

                $(control).attr("aria-describedby", newMessage);
                $(control).attr("aria-invalid", newMessage.length > 0);
            }
            else {
                if (oldDescrybedByVal.indexOf(" " + errorSpan.id) === -1) {
                    $(control).attr("aria-describedby", oldDescrybedByVal + " " + errorSpan.id);
                    $(control).attr("aria-invalid", true);
                }
            }
        };
    }

    if (window.ValidationSummaryOnSubmit) {
        var proxiedSummary = window.ValidationSummaryOnSubmit;

        window.ValidationSummaryOnSubmit = function () {
            var result = proxiedSummary.apply(this, arguments);

            onAfterSummary(arguments);

            return result;
        };

        var onAfterSummary = function (arguments) {
            if (typeof (Page_ValidationSummaries) == "undefined")
                return;

            $(Page_ValidationSummaries[0]).html("One or more errors have occurred when attempting to create your account.");
        };
    }
    
})(jQuery);