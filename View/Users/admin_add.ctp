<h2>Add Cook</h2>

<br />
<script>
function goBack() {
    window.history.back()
}
</script>
<button onclick="goBack()" class="btn btn-success">Back</button>
<div class="row">
    <div class="col-sm-4">

        <?php echo $this->Form->create('User',array('enctype'=>'multipart/form-data'));?>
        <?php echo $this->Form->input('role', array('class' => 'form-control', 'options' => array('admin' => 'admin', 'cook'=>'cook','customer' => 'customer'))); ?>
        <br />
        <?php echo $this->Form->input('first_name', array('class' => 'form-control')); ?>
        <br />
        <?php echo $this->Form->input('last_name', array('class' => 'form-control')); ?>
        <br />
        <?php echo $this->Form->input('username', array('class' => 'form-control')); ?>
        <br />
        <?php echo $this->Form->input('email', array('class' => 'form-control')); ?>
         <br />
         <?php echo $this->Form->input('description', array('class' => 'form-control')); ?>
         <br />
        <?php echo $this->Form->input('password', array('class' => 'form-control','type' => 'password')); ?>
         <br />
		 <?php echo $this->Form->input('cpassword', array('class' => 'form-control','type' => 'password','label' => 'confirm password')); ?>
         <br />
        <?php echo $this->Form->input('city', array('class' => 'form-control')); ?>
         <br />
       <div class="input text">
        <label for="UserCountry">Province/State</label>
       <?php echo $this->Form->input('country', array('class' => 'form-control','div'=>false,'label'=>false)); ?>
        </div>
        <br />
        <?php echo $this->Form->input('address_type', array('class' => 'form-control')); ?>
        <br />
        <?php echo $this->Form->input('parking', array('class' => 'form-control')); ?>
         <br />
        <?php echo $this->Form->input('image', array('class' => 'form-control','type'=>'file')); ?>
        <br />
         <?php echo $this->Form->input('delivery', array('class' => 'form-control', 'options' => array('yes' => 'Yes', 'no'=>'No'))); ?>
        <br />
        <?php echo $this->Form->input('active', array('type' => 'checkbox')); ?>
        <br />
        <?php echo $this->Form->button('Submit', array('class' => 'btn btn-primary')); ?>
        <?php echo $this->Form->end(); ?>

    </div>
</div>