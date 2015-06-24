<?php
/**
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       app.View.Layouts
 * @since         CakePHP(tm) v 0.10.0.1076
 * @license       http://www.opensource.org/licenses/mit-license.php MIT License
 */

//$cakeDescription = __d('cake_dev', 'CakePHP: the rapid development php framework');
//$cakeVersion = __d('cake_dev', 'CakePHP %s', Configure::version())
?>
<!DOCTYPE html>
<html>
<head>
	<?php echo $this->Html->charset(); ?>
	<title><?php echo Configure::read('Settings.SHOP_TITLE'); ?></title>
<meta property="og:title" content="" />
<meta property="og:type" content="article" />
<meta property="og:image" content="http://projects.udaantechnologies.com/yumplate/images/logo.gif" />
<!--meta property="og:url" content="" /-->
<meta property="og:description" content="Joseph immigrated to Canada via Italy and Holland " /
    

	<?php
		echo $this->Html->meta('icon');
    echo $this->Html->meta('og:description','The Turducken of Cookies');
    //echo $this->Html->meta('description','Flat, Clean, Responsive, application admin template built with bootstrap 3');
		echo $this->Html->meta('viewport','width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1');
		echo $this->Html->css(array('bootstrap','fonts','style','animate.min','responsive','toolitup-jrate'));

?>
<script type="text/javascript">
                var SITE_URL = '<?php echo SITE_URL.'yumplate/'; ?>';
            </script>
<?php
		echo $this->Html->script(array('jquery-1.11.2.min','bootstrap','oauth','jRate','yumplate'));
    

		echo $this->fetch('meta');
		echo $this->fetch('css');
    echo $this->fetch('script');
		
	?>

</head>
<body>
  <!-- HEADER -->
        <header class="header">
          <?php echo $this->Session->flash(); ?>
            <nav class="navbar navbar-default navbar-fixed-top">
                <div class="container">
                <?php echo $this->element('front_header');?>
			      </div>
            </nav>
        </header>
          <!-- HEADER --> 
          <?php if($this->params->params['action']=='index'){ ?>
          <section class="slider">
            <div class="home-slider">
                <div class="caption">
                    <h1>Order authentic meals<br/>made in your neighbour's kitchen</h1>
                    <div class="btn-row">
                      
                <?php 
               echo $this->Form->create('Product',array('action'=>'RedirectUrl'));
               echo $this->Form->input('keywords',array('type'=>'text','placeholder'=>'Search meals','div'=>false,'label'=>false));
                ?>
                 <button type="submit" class="btn btn-primary">ExploreYum</button>

               <?php echo $this->Form->end();
                echo $this->Html->link('How it Works',
                array(
                'controller' => 'products',
                'action' => 'howitworks',
                'full_base' => true
                ),
                array('class'=>'btn btn-h-works')
                );
                ?>
                    </div>
                </div>
            </div>
          </section>

          <?php  } ?>

        <!-- BODY SECTION -->
        <section class="<?php if($this->params->params['action']=='meal'){ echo 'bodySec';}else{echo 'feature-products';} ?>">
       <div class="<?php if($this->params->params['action']=='meal'){ echo 'meals-container';}else{echo 'container';} ?>">
       
         <?php echo $this->fetch('content'); ?>
		</div>
		 </section>
         <?php if($this->params->params['action']=='index'){ 
            echo $this->element('community');
           } ?>
        
            
		<div class="footer">
	    <?php 

		echo $this->element('front_footer');
    echo $this->Form->input('page_url',array('type'=>'hidden','value'=>$this->Html->url('/',true)));

       ?>
		</div>
	</div>
	<?php echo $this->element('sql_dump'); ?>
</body>
</html>
