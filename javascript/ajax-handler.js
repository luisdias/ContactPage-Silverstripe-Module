/*
Copyright (c) 2012 Luis E. S. Dias - www.smartbyte.com.br

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/
$().ready(function() {
    $("#Form_sendContactForm").validate({                                 
        rules: {
            contact_name: {
                required: true
            },            
            contact_email: {
                required: true,
                email: true
            },
            contact_message: {
                required: true,
                minlength: 20
            },
            captcha_code: {
                required: true
            }            
        },
        messages: {
            contact_name:  nameValidationMessage,
            captcha_code: captchaValidationMessage,
            contact_email:  emailValidationMessage,
            contact_message: textValidationMessage
        },
        submitHandler: function() {
            $.ajax({
            type: "POST",
            url: window.location.href + "sendContactForm",
            dataType: "text",
            data: "contact_name=" + $('[name="contact_name"]').val() + '&' +
                "contact_email=" + $('[name="contact_email"]').val() + '&' +
                "contact_message=" + $('[name="contact_message"]').val() + '&' +
                "captcha_code=" + $('[name="captcha_code"]').val(),
            success: function(data, textStatus, jqXHR){
                // ContactPage_Controller->sendContactForm
                if (data == 0) { // mail error
                    $("#basic-modal-content" ).html(formSubmitErrorMessage);
                } else if ( data == -1 ){ // captcha error
                    $("#basic-modal-content" ).html(captchaValidationMessage);
                } else if ( data == 1 ) { // ok
                    $("#basic-modal-content" ).html(formSubmitSuccessMessage);
                    $('#Form_sendContactForm_action_sendContactForm').attr('disabled', 'disabled');
                } else {
                    $("#basic-modal-content" ).html(unknowErrorMessage);
                }
                $("#basic-modal-content").modal();
            },
            error: function(jqXHR, textStatus, errorThrown) {
                $("#basic-modal-content" ).html(textStatus);            
                $("#basic-modal-content").modal();
            }
            });                
        }                    
    });
});