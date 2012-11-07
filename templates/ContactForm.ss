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
<form $FormAttributes>
   <fieldset>
       <p>
       <div class="contact-form-label"><label for="Form_sendContactForm_name">Name</label></div>
       <div class="contact-form-field">$dataFieldByName(name)</div>
       <div class="contact-form-error"><label for="Form_sendContactForm_name" generated="false" class="error"></label></div>
       </p>       
       
       <p>
       <div class="contact-form-label"><label for="Form_sendContactForm_email">Email</label></div>
       <div class="contact-form-field">$dataFieldByName(email)</div>
       <div class="contact-form-error"><label for="Form_sendContactForm_email" generated="false" class="error"></label></div>
       </p>

       <p>
       <div class="contact-form-label"><label for="Form_sendContactForm_message">Message</label></div>
       <div class="contact-form-field">$dataFieldByName(message)</div>
       <div class="contact-form-error"><label for="Form_sendContactForm_message" generated="false" class="error"></label></div>
       </p>
       
       <p>       
       <div class="contact-form-label"><label for="Form_sendContactForm_captcha_code">Verify code</label></div>
       <div class="contact-form-field">$dataFieldByName(captcha_code)</div>
       <div class="contact-form-error"><label for="Form_sendContactForm_captcha_code" generated="false" class="error"></label></div>
       </p>

       <p>$Fields.FieldByName(captcha_img)</p>
       &nbsp;
       <a href="#" onclick="document.getElementById('captcha').src = '{$BaseHref}contactpage/code/captcha/securimage/securimage_show.php?sid=' + Math.random(); return false">
           <img src="{$BaseHref}contactpage/images/refresh.png" height="32" width="32" />
       </a>
      $dataFieldByName(SecurityID)
   </fieldset>
   <br/>
   <% if Actions %>
      <div class="Actions">
         <% control Actions %>$Field<% end_control %>
      </div>
   <% end_if %>
</form>
<br/>
<div id="dialog-modal" title="Alert"></div>