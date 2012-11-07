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
jQuery(document).ready(function() {    
    jQuery("#Form_sendContactForm").validate({                                 
        rules: {
            name: {
                required: true
            },            
            email: {
                required: true,
                email: true
            },
            message: {
                required: true,
                minlength: 20
            },
            captcha_code: {
                required: true
            }            
        },
        messages: {
            name:  nameValidationMessage,
            captcha_code: captchaValidationMessage,
            email:  emailValidationMessage,
            message: textValidationMessage
        },
        submitHandler: function() {            
            $.ajax({
            type: "POST",
            url: window.location.pathname + "/sendContactForm",
            dataType: "text",
            data: "name=" + $('[name="name"]').val() + '&' +
                "email=" + $('[name="email"]').val() + '&' +
                "message=" + $('[name="message"]').val() + '&' +
                "captcha_code=" + $('[name="captcha_code"]').val(),
            success: function(data, textStatus, jqXHR){
                // ContactPage_Controller->sendContactForm
                if (data == 0) { // mail error
                    $( "#dialog-modal" ).html(formSubmitErrorMessage);                      
                } else if ( data == -1 ){ // captcha error
                    $( "#dialog-modal" ).html(captchaValidationMessage);
                } else if ( data == 1 ) { // ok
                    $( "#dialog-modal" ).html(formSubmitSuccessMessage);
                }
                $(function() {
                    $( "#dialog-modal" ).dialog({
                        height: 140,
                        modal: true
                    });
                });                                
            },
            error: function(jqXHR, textStatus, errorThrown) {
                $( "#dialog-modal" ).html(textStatus);
                $(function() {
                    $( "#dialog-modal" ).dialog({
                        height: 140,
                        modal: true
                    });
                });                  
            }
            });                
        }                    
    });
});