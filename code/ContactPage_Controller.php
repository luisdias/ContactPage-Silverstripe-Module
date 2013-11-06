<?php
/*
Copyright (c) 2013 Luis E. S. Dias - smartbyte.systems@gmail.com

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
    private static $allowed_actions = array(
           'sendContactForm'
       );
    
    public function init() {
        parent::init();
        Requirements::javascript("contactpage/javascript/jquery.simplemodal-1.4.4.js");
        Requirements::javascript("contactpage/javascript/jquery.validate.min.js");
        Requirements::javascript("contactpage/javascript/messages.js");
        Requirements::javascript("contactpage/javascript/ajax-handler.js");
        
        Requirements::css("contactpage/css/ContactPage.css");
        Requirements::css("contactpage/css/basic-jquery-simplemodal.css");
    }
    
    public function renderContactForm() {	
        $fields = new FieldList(
            TextField::create("contact_name")->setMaxLength(50),
            EmailField::create("contact_email")->setMaxLength(50),
            TextareaField::create("contact_message"),
            TextField::create("captcha_code")->setMaxLength(6)
        );
        
        $action = new FieldList(
            FormAction::create('sendContactForm', 'Submit')
        );
        
        $requiredFields = new RequiredFields(array('contact_name','contact_email','contact_message','captcha_code'));
        $contactForm = new Form($this,'sendContactForm', $fields, $action, $requiredFields);
        $contactForm->setTemplate('ContactForm');
        return $contactForm;
    }
	
    public function sendContactForm($data, Form $form) {
        if( Director::is_ajax() ) {             
            require_once Director::baseFolder () . '/contactpage/code/captcha/securimage.php';            
            $securimage = new Securimage();
            if ($securimage->check($data['captcha_code']) == false) {
                return -1;
            }
            $to = $this->EmailTo;
            $subject = $this->Title . ' - ' . $data['contact_name'];
            $email = new Email($data['contact_email'], $to, $subject, $data['contact_message'] );
            $sent = $email->sendPlain();
            if ($sent) {                  
                return 1;
            } else {
                return 0;
            }            
        } else { 
            return 0;
        } 
    }
       
}