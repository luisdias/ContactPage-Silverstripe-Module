<?php
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
class ContactPage_Controller extends Page_Controller 
{
    public function init() {
        parent::init();
        Validator::set_javascript_validation_handler('none');
        
        Requirements::javascript("contactpage/javascript/jquery-1.8.2.min.js");        
        Requirements::javascript("contactpage/javascript/jquery.validate.min.js");
        Requirements::javascript("contactpage/javascript/jquery-ui-1.9.1.custom.min.js");
        
        Requirements::javascript("contactpage/javascript/messages.js");
        Requirements::javascript("contactpage/javascript/ajax-handler.js");
        
        Requirements::css("contactpage/css/ContactPage.css");
        Requirements::css("contactpage/css/jquery-ui-1.9.1.custom.min.css");        
    }
    
    public function renderContactForm() {
        $fields = new FieldSet(
            new TextField("name","Name"),
            new EmailField("email","Email"),
            new TextareaField("message","Message",10),
            new LiteralField('captcha_img','<img id="captcha" src="contactpage/code/captcha/securimage/securimage_show.php" alt="CAPTCHA image" />'),
            new TextField("captcha_code",'')
        );        
        
        $action = new FieldSet(
            new FormAction('sendContactForm', _t(ContactPage.SubmitButton,'Submit'))
        );
        
        $requiredFields = new RequiredFields(array('name','email','message','captcha_code'));
        $contactForm = new Form($this,'sendContactForm', $fields, $action, $requiredFields);
        
        $contactForm->setTemplate('ContactForm');
        return $contactForm;
    }
	
    public function sendContactForm($data) {
        if(Director::is_ajax() || isset($_GET["ajaxDebug"])) { 
            $this->isAjax = true; 
        } else { 
            $this->isAjax = false; 
        } 
        require_once Director::baseFolder () . '/contactpage/code/captcha/securimage/securimage.php';		
        $securimage = new Securimage();
        if ($securimage->check($data['captcha_code']) == false) {
            return -1;
        }

        $to = $this->EmailTo;
        $subject = $this->Title . ' - ' . $data['name'];
        $email = new Email($data['email'], $to, $subject, $data['message'] );
        $sent = $email->sendPlain();		
        if ($sent) {                  
            return 1;
        } else {
            return 0;
        }
    }
       
}