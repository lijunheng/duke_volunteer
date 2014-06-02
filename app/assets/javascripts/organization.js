// Set up the UI/UX for the ships screens.  This object sets up all the functionality we need to:
//  1.  Bind to the "click" event of the "#addButton" on the modal form.
//  2.  Append data from the modal form to the Pilots table.
//  3.  Hide the modal form when the user is done entering data.
//
// If any other events need to be wired up, the init function would be the place to put them.
var organizationFieldsUI = {
    init: function() {
        // Configuration for the jQuery validator plugin:
        // Set the error messages to appear under the element that has the error.  By default, the
        // errors appear in the all-too-familiar bulleted-list.
        // Other configuration options can be seen here:  https://github.com/victorjonsson/jQuery-Form-Validator
        var validationSettings = {
            errorMessagePosition : 'element'
        };

        // Run validation on an input element when it loses focus.
        $('#new-organization-fields').validateOnBlur();

        $('#submit-button').on('click', function(e) {
            // If the form validation on our Pilots modal "form" fails, stop everything and prompt the user
            // to fix the issues.
            var isValid = $('#new-organization-fields').validate(false, validationSettings);
            if(!isValid) {
                e.stopPropagation();

                return false;
            }

            // This is the code from previous posts...
            formHandler.appendFields();
            formHandler.hideForm();
        });
    }
};