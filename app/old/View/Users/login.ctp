<h1>Login</h1>

<br />
<?php //echo $this->layout;?>
<div class="row">
    <div class="col-sm-3">

        <?php echo $this->Form->create('User', array('action' => 'login')); ?>
        <?php echo $this->Form->input('email', array('type'=>'text','placeholder'=>'Email','class' => 'form-control', 'autofocus' => 'autofocus')); ?>
        <br />
        <?php echo $this->Form->input('password', array('class' => 'form-control')); ?>
        <br />
       
        <?php echo $this->Form->button('Login', array('class' => 'btn btn-primary')); ?>

        <?php echo $this->Form->end(); ?>
        <br />
         <a id="forget_pass" class="forget-link" href="javascript:void(0)">Forget Password</a>
        <br />
        <br />

    </div>
</div> 