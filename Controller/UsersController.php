<?php
App::uses('AppController', 'Controller');
class UsersController extends AppController {

////////////////////////////////////////////////////////////

    public function beforeFilter() {

        parent::beforeFilter();
        $this->Auth->allow(array('login','profile','SocialRegister','contact','admin_stories','forgetPassword'));

    }

////////////////////////////////////////////////////////////

    public function login() {

   // echo AuthComponent::password('kumar@123');

        if ($this->request->is('post')) {
                    
            if($this->Auth->login()) {
               
                 $this->User->id = $this->Auth->user('id');
                 $data['last_login']=date('Y-m-d H:i:s');
                 $this->User->save($data);
              
                if ($this->Auth->user('role') == 'customer') {
                      //echo $this->Auth->user('role');die;
                            if($this->referer()=='http://projects.udaantechnologies.com/yumplate/users/login'){
                                $this->redirect('/');
                            }else{
                                return $this->redirect($this->referer());
                            }
                    
                   /* return $this->redirect(array(
                        'controller' => 'products',
                        'action' => 'index',
                       // 'customer' => true,
                       // 'admin' => false
                    )); */
                } elseif ($this->Auth->user('role') == 'admin') {
                    $uploadURL = Router::url('/') . 'app/webroot/upload';
                    $_SESSION['KCFINDER'] = array(
                        'disabled' => false,
                        'uploadURL' => $uploadURL,
                        'uploadDir' => ''
                    );
                    return $this->redirect(array(
                        'controller' => 'users',
                        'action' => 'dashboard',
                        'manager' => false,
                        'admin' => true
                    ));
                } else {
                    $this->Session->setFlash('Login is incorrect');
                }
            } else {
                $this->Session->setFlash('Login is incorrect');
            }
        }
    }

////////////////////////////////////////////////////////////

    public function logout() {
        $this->Session->setFlash('Successfully logout','default',array('class'=>'alert alert-success'));
        $_SESSION['KCEDITOR']['disabled'] = true;
        unset($_SESSION['KCEDITOR']);
        return $this->redirect($this->Auth->logout());
    }

     public function profile($id = null) {
        //
        //echo $id; die;
        $this->layout = 'front';
       // echo $this->layout;
       $this->loadModel('Product');
       $this->loadModel('Cart');
      
       $product = $this->User->find('first', array(
        'recursive' => -1,
         'contain'=>array('Product'=>array('fields'=>'id'),'Review'=>array('fields'=>array('Count(Review.id) as count'))),
         'conditions' => array(
        // 'Brand.active' => 1,
        'User.active' => 1,
        'User.username' => $id
        ),
        'fields'    => array( 
        'SUM( User.reviews_avg_val_rating+User.reviews_avg_ontime_rating+User.reviews_avg_easyfind_rating ) AS sum','User.*'
        // +whatever else you need
        )
        ));
        //pr($product);
        $productIds=array();
        foreach ($product['Product'] as $key => $value) {
           $productIds[$key]=$value['id'];
        }
        $this->set('productIds',implode(',',$productIds));
        $this->set('count',$this->Cart->find('count',array('conditions'=>array('Cart.user_id'=>$this->Session->read('Auth.User.id')))));
        $this->set(compact('product'));

       
    }

////////////////////////////////////////////////////////////

    public function customer_dashboard() {
    }




///////////////////////////////////////////////
    //for customer and chef profile
    public function customer_view() {
        $this->User->id = $this->Session->read('Auth.User.id');
        if (!$this->User->exists()) {
            throw new NotFoundException('Invalid user');
        }
        $this->set('user', $this->User->read(null, $this->Session->read('Auth.User.id')));


    }


//////////////////////////////////////////////////////////
    public function customer_change_password(){
         if($this->request->is('post')){
               if($this->User->save($this->request->data)){
                $this->Session->setFlash('Successfully change your password','default',array('class'=>'alert alert-success'));
                return $this->redirect('/customer');
               }else{
                $this->Session->setFlash('Unautharised User !','default',array('class'=>'alert alert-success'));
                return $this->redirect('/customer');
               }
         }
    }


//////////////////////////////////////////////////////////


    public function customer_edit($id = null) {
        $this->User->id = $id;
        if (!$this->User->exists()) {
            throw new NotFoundException('Invalid user');
        }
        if ($this->request->is('post') || $this->request->is('put') ) {
            $UploadImg=WWW_ROOT.'images/UserImg/';
            if(!empty($this->request->data['User']['image']['name'])){
             move_uploaded_file($this->request->data['User']['image']['tmp_name'], $UploadImg.$this->request->data['User']['image']['name']);
            $this->request->data['User']['image']=$this->request->data['User']['image']['name'];
            }else{
            $this->request->data['User']['image']=$this->request->data['User']['image_name'];
            }
           //pr($this->request->data);die;
            if ($this->User->save($this->request->data)) {
                $this->Session->setFlash('The user has been saved');
                return $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('The user could not be saved. Please, try again.');
            }
        } else {
            $this->request->data = $this->User->read(null, $id);
        }
    }
////////////////////////////////////////////////////////////

    public function admin_dashboard() {
    }

////////////////////////////////////////////////////////////
 

    public function admin_index() {

        $this->Paginator = $this->Components->load('Paginator');

        $this->Paginator->settings = array(
            'User' => array(
                'recursive' => -1,
                'contain' => array(
                ),
                'conditions' => array(
                ),
                'order' => array(
                    'User.last_login' => 'DESC'
                ),
                'limit' => 20,
                'paramType' => 'querystring',
            )
        );
        $users = $this->Paginator->paginate();
        ///pr($users);
        $this->set(compact('users'));
    }

////////////////////////////////////////////////////////////

    public function admin_view($id = null) {
        $this->User->id = $id;
        if (!$this->User->exists()) {
            throw new NotFoundException('Invalid user');
        }
        $this->set('user', $this->User->read(null, $id));
    }



////////////////////////////////////////////////////////////

    public function admin_add() {
        if ($this->request->is('post')) {

            $UploadImg=WWW_ROOT.'images/UserImg';
            if(!dir($UploadImg)){
                @mkdir($UploadImg,true,0777);

            }
           
            if(!empty($this->request->data['User']['image']['name'])){
             move_uploaded_file($this->request->data['User']['image']['tmp_name'], $UploadImg.'/'.$this->request->data['User']['image']['name']);
            $this->request->data['User']['image']=$this->request->data['User']['image']['name'];
            }else{
            $this->request->data['User']['image']='';
            }
            
              $this->User->create();
            if ($this->User->save($this->request->data)) {
                $this->Session->setFlash('The user has been saved');
                return $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('The user could not be saved. Please, try again.');
            }
        }
    }

////////////////////////////////////////////////////////////

    public function admin_edit($id = null) {
        $this->User->id = $id;
        if (!$this->User->exists()) {
            throw new NotFoundException('Invalid user');
        }
        if ($this->request->is('post') || $this->request->is('put') ) {
            $UploadImg=WWW_ROOT.'images/UserImg/';
            if(!empty($this->request->data['User']['image']['name'])){
             move_uploaded_file($this->request->data['User']['image']['tmp_name'], $UploadImg.$this->request->data['User']['image']['name']);
            $this->request->data['User']['image']=$this->request->data['User']['image']['name'];
            }else{
            $this->request->data['User']['image']=$this->request->data['User']['image_name'];
            }
           //pr($this->request->data);die;
            if ($this->User->save($this->request->data)) {
                $this->Session->setFlash('The user has been saved');
                return $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('The user could not be saved. Please, try again.');
            }
        } else {
            $this->request->data = $this->User->read(null, $id);
        }
    }

////////////////////////////////////////////////////////////

    public function admin_password($id = null) {
        $this->User->id = $id;
        if (!$this->User->exists()) {
            throw new NotFoundException('Invalid user');
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->User->save($this->request->data)) {
                $this->Session->setFlash('The user has been saved');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('The user could not be saved. Please, try again.');
            }
        } else {
            $this->request->data = $this->User->read(null, $id);
        }
    }

////////////////////////////////////////////////////////////

    public function admin_delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->User->id = $id;
        if (!$this->User->exists()) {
            throw new NotFoundException('Invalid user');
        }
        if ($this->User->delete()) {
            $this->Session->setFlash('User deleted');
            return $this->redirect(array('action'=>'index'));
        }
        $this->Session->setFlash('User was not deleted');
        return $this->redirect(array('action' => 'index'));
    }

////////////////////////////////////////////////////////////

    public function checkout() {
    	$this->layout='front';
        $userId = $this->Auth->user('id');
        //pr($this->request->data);die;
        if($this->request->is('post')){
            
        App::import('Vendor', 'checkout/PaypalExpressCheckout');
        
        $gateway = new PaypalGateway();
        $gateway->apiUsername =Configure::read('Settings.PAYPAL_API_USERNAME');//API_USERNAME;
        $gateway->apiPassword =Configure::read('Settings.PAYPAL_API_PASSWORD'); //API_PASSWORD;
        $gateway->apiSignature =Configure::read('Settings.PAYPAL_API_SIGNATURE'); //API_SIGNATURE;
        $gateway->testMode =true;

        // Return (success) and cancel url setup
        $gateway->returnUrl =Configure::read('Settings.AUTHORIZENET_ENABLED');;
        $gateway->cancelUrl =Configure::read('Settings.AUTHORIZENET_ENABLED');;
        //create instance of paypal
        $paypal = new PaypalExpressCheckout($gateway);
        $shipping = false;

        $userId = $this->Auth->user('id');
        //$requestUrl = $this->params->params['pass'][0];
        if (!isset($resultData)) {
        $resultData = Array();
        }

        if (isset($_GET['action'])) {
            $action = $_GET['action'];
        }
        $transaction=array();
             
            if($userId)
            {
              // $PriceArr=$this->ProductPrice($userId);
               //pr($PriceArr);die;
               $_SESSION["userId"] =$userId;
               $_SESSION["price"] =$this->request->data['Product']['amount'];
              // $_SESSION["product_ids"] =$PriceArr['product_ids'];
              // $_SESSION["pet_ids"] =$PriceArr['pet_ids'];
               $amount=$this->request->data['Product']['amount'];
             
              $paypal->doExpressCheckout($amount, 'Paypal Express','', 'USD', $shipping, $resultData);
            }

            
            if(isset($_GET['action']) && base64_decode($_GET['action']) == "success") 
            {
                
                if ($transaction = $paypal->doPayment($_GET['token'], $_GET['PayerID'], $resultData)) {
                    
                    //pr($transaction); die;
                    // insert data in payment table
                    $data = array();
                    $data['transaction_id'] = $transaction['TRANSACTIONID'];
                    $data['status'] = $transaction['ACK'];
                    $data['amount'] = $transaction['AMT'];
                    $data['other_info'] = json_encode($transaction);
                    $data['product_id'] =$_SESSION["product_ids"];
                    $data['user_id'] = $_SESSION["userId"];

                    $this->loadModel('Payment');

                    $retPayment = $this->Payment->save($data);
                   //save expire date in product table
                    $productIds=explode(',',$_SESSION["product_ids"]);
                    $petIds=explode(',',$_SESSION["pet_ids"]);
                    $this->loadModel('Product');
                    $productArr = array();
                    $productArr['id'] = $retPayment['Payment']['product_id'];
                    $dt = date("Y-m-d");
                    $expiredate= date( "Y-m-d", strtotime( "$dt +3 day" ));
                       // pr($this->Product);die;
                    //$this->Product->save($productArr);
                     $Pro_Arr=array();
                     $giftArr=array();
                     foreach ($productIds as $key => $value) {
                              $Pro_Arr[$key]['id']=$value;
                              $Pro_Arr[$key]['expire_num']= 3;
                              $Pro_Arr[$key]['expire_type']='days';
                              $Pro_Arr[$key]['expire_date']=$expiredate;
                              $giftArr[$key]['product_id']=$value;
                              $giftArr[$key]['user_id']=$_SESSION["userId"];
                              $giftArr[$key]['pet_id']=$petIds[$key];
                     }
                      $this->loadModel('UserGift');
                      $this->UserGift->saveAll($giftArr);
                    if($this->Product->saveAll($Pro_Arr))
                    {
                        $this->loadModel('Cart');
                        $this->loadModel('Pet');
                        $this->Cart->deleteAll(array('Cart.user_id'=>$userId));

                    }
                    $this->Session->setFlash(__('your have successfully purchase the product !'),'success_flash');
                    $petSlug = $this->Pet->find('first',array('fields'=>'Pet.slug','conditions'=>array('Pet.id'=>$petIds[0])));
                    $this->redirect('/p/'.$petSlug['Pet']['slug']);
                    //$this->set('data',$this->Payment->find('first',array('conditions'=>array('Payment.id'=>$retPayment['Payment']['id']),'contain'=>array('User'))));
                    
    
                } 
                else {
                    //unset($_SESSION["userId"]);
                    unset($_SESSION["product_ids"]);
                    unset($_SESSION["price"]);
                    $this->redirect('/pages/products/');
                }
            }else{
                echo 'error';
            }

        }else{
             $this->redirect('/');
        }
       
    }

    
    
    
    
    public function Register(){
        $this->layout='front';
        if($this->request->is('post')){
           
            $this->request->data['User']['username']=$this->request->data['User']['first_name'];
            
       
          
                if($this->User->save($this->request->data)){
                $last = $this->User->findById($this->User->id);
                $this->Session->write('Auth',$last); 
                $this->Session->setFlash('Sucessfully Register','default',array('class'=>'alert alert-success')); 
                $this->redirect(array('controller'=>'products','action'=>'index'));
                }else{
                     $this->Session->setFlash('Data not saved','default',array('class'=>'alert alert-danger')); 
                }
           
            
        }
        
        
    }
    
    public function SocialRegister(){
        $this->autoRender=false;
        if($this->request->is('post')){
         
          $data=array();
          $data['User']['first_name']=$this->request->data['name'];
          $data['User']['last_name']=$this->request->data['last_name'];
          $data['User']['email']=$this->request->data['email'];
          $data['User']['social_login']=1;
          $data['User']['role']='customer';
           $data['User']['image_link']='http://graph.facebook.com/'.$this->request->data['id'].'/picture?type=large';
          $data['User']['username']=$this->request->data['name'];
           
         //if($this->User->SendSocialRegisterMail($data)){
          $userData=$this->User->find('first',array('conditions'=>array('User.email'=>$this->request->data['email'])));
          if(empty($userData)){
                if($this->User->save($data)){
                    $this->Session->write('Auth',$data);
                    echo json_encode(array('type'=>'success'));die;
                }else{
                    echo json_encode(array('type'=>'error','msg'=>'Does Not saved'));die;
                }
             }else{
                $this->User->id = $userData['User']['id'];
                $data['last_login']=date('Y-m-d H:i:s');
                $this->User->saveField('last_login', $data['last_login'], false);
                  if(empty($userData['User']['image_link'])){
                    $user_data['image_link']=$data['User']['image_link'];
                    $this->User->id=$userData['User']['id'];
                    $this->User->save($user_data);
                  }
                 $this->Session->write('Auth', $userData);
                  echo json_encode(array('type'=>'exists'));die;
             }
        }
        
        
    }


    ////////////////////////////////////////////////////////////
  //function for send mail to admin
    public function makestatus() {
        $this->autoRender=false;

      if($this->request->is('post')){
        //pr($this->request->data);die;
         if($this->User->SendAdminMail($this->request->data)){
                  echo json_encode(array('type'=>'success'));die;
                }else{
                    echo json_encode(array('type'=>'failure'));die; 
                }
      }
       
    }


  ////////////////////////////////////////////////////////////
  //function for send mail to admin
    public function forgetPassword() {
       if($this->request->is('post')){
                   //pr($this->data);die;
                $this->User->recursive = 0;
                $user = $this->User->find('first',array('fields' => array('User.id', 'User.username','User.first_name','User.last_name'), 'conditions'=>array('email ='=>$this->data['User']['email'])));
                //pr($user);die;
                
                if(!empty($user))
                {

                $userId = $user['User']['id'];
                $userName = $user['User']['username'];
                $fullName = $user['User']['first_name']." ".$user['User']['last_name'];
                $newPassword = $this->generatePassword();
               
                $newPasswordMd5 =AuthComponent::password($newPassword);
                //pr( $newPasswordMd5); die;

                if($this->User->updatePassword($userId,$newPasswordMd5))
                 {
                $this->User->sendForgetPassMail($this->data['User']['email'],$userName,$userId,$fullName,$newPassword);
                $this->Session->setFlash('An email is send to you of change Password. Please Check your mail !','default',array('class'=>'alert alert-success'));
                $this->redirect('/users/register');
                }
                }else{
                $this->Session->setFlash('Unautharised User !','default',array('class'=>'alert alert-success'));
                $this->redirect('/users/register');
                }

        } 
       
    }


//////////////////////////////////////////////////////////////////
    public function generatePassword ($length = 8){

        $password = "";
       // define possible characters
        $possible = "0123456789abcdefghjkmnpqrstvwxyz";
        // set up a counter
        $i = 0;
        // add random characters to $password until $length is reached
        while ($i < $length) 
        {
            // pick a random character from the possible ones
            $char = substr($possible, mt_rand(0, strlen($possible)-1), 1);
            // we don't want this character if it's already in the password
            if (!strstr($password, $char)) 
            {
              $password .= $char;
              $i++;
            }

        }
        return $password;

  }
  

  //////////////////////////////////////////////////////////////

  public function _sendNewUserMail($email,$userName,$userId,$fullName,$pass) 
   { 
        $setUrl = "";
        $this->__setSmtp();
        $this->SwiftMailer->sendAs = 'html';
        $this->SwiftMailer->from = SMTP_USER;
        $this->SwiftMailer->fromName = 'Administrator';
        //$this->SwiftMailer->cc = 'ritesh.satia@gmail.com';
        $this->SwiftMailer->to = trim($email);
        
        $setUrl =FULL_BASE_URL."/users/";
        //$this->set('setUrl',$setUrl);
        $fpStatus = 1;
        $this->Session->write('forgetpass.userName',$userName);
        $this->Session->write('forgetpass.fullName',$fullName);
        $this->Session->write('forgetpass.pass',$pass);
        $this->Session->write('forgetpass.setUrl',$setUrl);
        $this->Session->write('forgetpass.SITE_TITLE','Rug Studio Online');
        $this->User->updateForgotPassStatus($userId,$fpStatus);
        $this->SwiftMailer->send('forgot_password', 'Rug Studio Online Reset Password');
        $this->Session->delete('forgetpass');


  }

}
