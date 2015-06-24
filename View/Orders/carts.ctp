<div class="main-order">
    
        <h2 class="order-heading ">Review Order</h2>
		<div class="row">
        <div class="col-sm-8">
            <?php //pr($cart_meals);
if(!empty($cart_meals)){ 
    foreach ($cart_meals as $key => $value) {?>
        <div class="col-sm-12 no-padding">
            <h4>Pick up on: <?php echo ucfirst($key);?> </h4>
            <table class="table table-bordered order-table">
                <tr>
                    <th colspan="2">Meal</th>
                    <th width="16%">Price</th>
                    <th width="16%">Unit</th>
                    <th width="16%">Total</th>
                </tr>
				<?php foreach ($value as $key1 => $value1) { ?>
                <tr id="<?php echo $value1['cart_id'];?>" >
                    <td style="width:80px;">
					<?php 
                    echo $this->Html->image('/images/small/'.$value1['Product']['image'],array('alt'=>'','class'=>'order-img','url'=>array('controller'=>'products','action'=>'view','slug'=>$value1['Product']['slug'])));
                    ?>

                    <td style="width: 243px;"> 
                    <span>Chef: </span><?php echo $value1['User']['first_name'];?><br />
                    <span>Location: </span><?php echo $value1['User']['city'].' , '.$value1['User']['country'];?><br />
                    <?php echo $value1['Product']['name'];?> <br />
                    <span>Time of pick up: </span>between <?php  echo date('h:i A', strtotime($value1['Product']['pick_time_from'])).'-'.date('h:i A', strtotime($value1['Product']['pick_time_to']));?>
                    <br/>
                        <a href="javascript:void(0);" class="remove-add-cart" data-cart-id="<?php echo $value1['cart_id'];?>">Remove</a>
                    </td>
                    <td class="meal-price" data-price="<?php echo $value1['Product']['price'];?>">$<?php echo $value1['Product']['price'];?></td>
                    <td><select class="form-control meal-unit">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                        </select></td>
                    <td class="total-price">$<?php echo $value1['Product']['price'];?></td>				
                </tr>
				<?php } ?>

            </table>
        </div>
	<?php }}else{
		echo "No Meal in Carts";
		}?>
        </div>
        <div class="col-sm-4">
        <h4 style="visibility: hidden">Fix Table </h4>
        <table class="table table-bordered order-summary-table">
            <tr>
                <th colspan="2" class="text-center"><span >Order Summary</span></th>
            </tr>
            <tr>
                <td width="70%">Total items</td>
                <td width="30%" id="meal-items"></td>
            </tr>
            <tr>
                <td width="70%">Subtotal</td>
                <td width="30%" id="meal-subtotal"></td>
            </tr>
            <tr>
                <td class="meal-hst" data-hst="13">HST (13%)</td>
                <td class="hst-val"></td>
            </tr>
            <tr>
                <td><b>Total</b></td>
                <td id="meal-total" data-total="" ><b></b></td>
            </tr>
            <tr>
                <td class="text-center" colspan="2">
                <?php 
                echo $this->Form->create('Product',array('url'=>array('action'=>'checkout','controller'=>'users')));
                echo $this->Form->input('items',array('type'=>'hidden','value'=>''));
                echo $this->Form->input('amount',array('type'=>'hidden','value'=>''));

                ?>
               <button  class="button btn-cart" id="Proceed_to_Checkout" title="Proceed to Checkout" type="submit"><span><span>Proceed to Checkout</span></span></button></td>
                <?php echo $this->Form->end();?>
            </tr>
        </table>
    </div>
        

    	
 </div>
</div>