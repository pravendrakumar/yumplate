<?php echo $this->Html->link($data['Category']['name'], array('controller' => 'categories', 'action' => 'view',$data['Category']['slug'],'admin'=>false)); ?>