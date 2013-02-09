<!--
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
-->
<div id="ContactForm">
    <form $FormAttributes>
    <fieldset>
        <label for="Form_sendContactForm_name">Name</label>
        $Fields.FieldByName(name)
        <label for="Form_sendContactForm_name" generated="false" class="error"></label>

        <label for="Form_sendContactForm_email">Email</label>
        $Fields.FieldByName(email)
        <label for="Form_sendContactForm_email" generated="false" class="error"></label>

        <label for="Form_sendContactForm_message">Message</label>
        $Fields.FieldByName(message)
        <label for="Form_sendContactForm_message" generated="false" class="error"></label>

        <label for="Form_sendContactForm_captcha_code">Code</label>
        $Fields.FieldByName(captcha_code)
        <label for="Form_sendContactForm_captcha_code" generated="false" class="error"></label>
        
        $Fields.FieldByName(captcha_img)
        <a href="#" onclick="document.getElementById('captcha').src = '{$BaseHref}contactpage/code/captcha/securimage/securimage_show.php?sid=' + Math.random(); return false">
        <img src="{$BaseHref}contactpage/images/refresh.png" height="32" width="32" />
        </a>
        
        $Fields.FieldByName(SecurityID)
    </fieldset>
    <br/>
    <% if Actions %>
       <div class="Actions">
          <% control Actions %>$Field<% end_control %>
       </div>
    <% end_if %>
    </form>
</div>    
<div class="jqmAlert" id="ex3b">
    <div id="ex3b" class="jqmAlertWindow">
        <div class="jqmAlertTitle clearfix">
            <h1>Mensagem</h1><a href="#" class="jqmClose"><em>Close</em></a>
        </div>  
        <div class="jqmAlertContent"></div>
    </div>
</div>