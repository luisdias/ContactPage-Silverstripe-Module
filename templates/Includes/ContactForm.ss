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
        <div id="Name" class="field">
            <label class="left" for="{$FormName}_contact_name"><%t ContactForm.NAME "Name" %></label>
            $Fields.dataFieldByName(contact_name)
            <label for="{$FormName}_contact_name" generated="false" class="error"></label>
        </div>
        
        <div id="Email" class="field">
            <label class="left" for="{$FormName}_contact_email"><%t ContactForm.EMAIL "Email" %></label>
            $Fields.dataFieldByName(contact_email)
            <label for="{$FormName}_contact_email" generated="false" class="error"></label>
        </div>
        
        <div id="Message" class="field">
            <label class="left" for="{$FormName}_contact_message"><%t ContactForm.MESSAGE "Message" %></label>
            $Fields.dataFieldByName(contact_message)
            <label for="{$FormName}_contact_message" generated="false" class="error"></label>
        </div>

        <div id="Captcha" class="field">
            <img id="captcha" src="{$BaseHref}contactpage/code/captcha/securimage_show.php" alt="CAPTCHA image" />
            <a href="#" onclick="document.getElementById('captcha').src = '{$BaseHref}contactpage/code/captcha/securimage_show.php?sid=' + Math.random(); return false">
            <img id="refresh" src="{$BaseHref}contactpage/images/refresh.png" height="32" width="32" title="refresh" alt="refresh" />
            </a>
        </div>
        
        <div id="Code" class="field">        
            <label class="left" for="{$FormName}_captcha_code"><%t ContactForm.CODE "Code" %></label>
            $Fields.dataFieldByName(captcha_code)
            <label for="{$FormName}_captcha_code" generated="false" class="error"></label>
        </div>        
        $Fields.dataFieldByName(SecurityID)
    </fieldset>
    <br/>
    <% if Actions %>
       <div class="Actions">
          <% loop Actions %>$Field<% end_loop %>
       </div>
    <% end_if %>
    </form>
</div>    
<div id="basic-modal-content">
</div>
