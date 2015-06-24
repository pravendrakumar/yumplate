<div class="page-title">
<h4> <?php 
//$day_data=(date("l"))==$day?"Today's":$day.'\'s';
echo "This meal available on ".$day=$product['Product']['day'];

?></h4>
<div class="clear"></div> 
</div>
 <div class="row meals-para">
 <?php if(!empty($product)) {
           ?>
              <div class="col-sm-6">
                        <div class="mealThumb mr15" data-meal-id="<?php echo $product['Product']['id'] ; ?>">
                            <h5><?php echo $product['Product']['name'] ; ?> <span class="pull-right">$ <?php echo $product['Product']['price'] ; ?></span></h5>
							<h5 class="product-details">PICKUD BY :<?php echo $day;?>,<?php  echo date('h:i A', strtotime($product['Product']['pick_time_from'])).'-'.date('h:i A', strtotime($product['Product']['pick_time_to']));?> <span class="pull-right">ORDER BY : <?php echo $day;?>,<?php  echo date('h:i A', strtotime($product['Product']['order_time']));?></span></h5>
                            <figure>
                            <?php 
                            echo $this->Html->image('/images/large/'.$product['Product']['image'], array('alt' => '','url'=>array('controller'=>'products','action'=>'view','slug'=>$product['Product']['slug'])));
                            ?>

                            </figure>
                            <article>
                                <button class="pull-right btn become-btn add_meal_cart">
                                    + Add to Cart
                                </button>
                                <div class="rating-wrap" data-rating="<?php echo !empty($product['Product']['rating'])?$product['Product']['rating']:'0' ; ?>" data-product="<?php echo $product['Product']['id']; ?>" >
                                    <div id="product_<?php echo $product['Product']['id']; ?>" >
                                      
                                    </div>
                                    (<?php echo count($product['Review']); ?> reviews)
                                </div>
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active">
                            <a href="#story" aria-controls="story" role="tab" data-toggle="tab">Story</a>
                            </li>
                            <li role="presentation">
                            <a href="#ingredients" aria-controls="ingredients" role="tab" data-toggle="tab">Ingredients</a>
                            </li>
                            <li role="presentation">
                            <a href="#contains" aria-controls="contains" role="tab" data-toggle="tab">Contains</a>
                            </li>
                            <li role="presentation">
                            <a href="#serving" aria-controls="serving" role="tab" data-toggle="tab">Serving</a></li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="story">
                            <?php echo $product['Product']['story'];?></div>
                            <div role="tabpanel" class="tab-pane" id="ingredients">
                             <?php echo $product['Product']['ingredients'];?>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="contains">
                            <?php echo $product['Product']['contains'];?>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="serving">
                            <?php echo $product['Product']['serving'];?>
                            </div>
                           </div>
                       </article>
                        </div>
                    </div>
                    <?php }else{
                        echo trim('<span>There is no meal for this day</span>');
                    } ?>

 </div>
                   
                  
             