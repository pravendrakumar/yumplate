<?php echo $this->Html->css(array('bootstrap-editable.css', '/select2/select2.css'), 'stylesheet', array('inline' => false)); ?>
<?php echo $this->Html->script(array('bootstrap-editable.js', '/select2/select2.js'), array('inline' => false)); ?>

<script>

$(document).ready(function() {

    $('.category').editable({
        type: 'select',
        name: 'category_id',
        url: '<?php echo $this->webroot; ?>admin/products/editable',
        title: 'Category',
        source: <?php echo json_encode($categorieseditable); ?>,
        placement: 'right',
    });

    $('.brand').editable({
        type: 'select',
        name: 'brand_id',
        url: '<?php echo $this->webroot; ?>admin/products/editable',
        title: 'Brand',
        source: <?php echo json_encode($brandseditable); ?>,
        placement: 'right',
    });

    $('.name').editable({
        type: 'text',
        name: 'name',
        url: '<?php echo $this->webroot; ?>admin/products/editable',
        title: 'Name',
        placement: 'right',
    });

    $('.description').editable({
        type: 'textarea',
        name: 'description',
        url: '<?php echo $this->webroot; ?>admin/products/editable',
        title: 'Description',
        placement: 'right',
    });

    $('.price').editable({
        type: 'text',
        name: 'price',
        url: '<?php echo $this->webroot; ?>admin/products/editable',
        title: 'Price',
        placement: 'left',
    });

    $('.weight').editable({
        type: 'text',
        name: 'weight',
        url: '<?php echo $this->webroot; ?>admin/products/editable',
        title: 'Weight',
        placement: 'left',
    });

   /* $('.tags').editable({
        type: 'select2',
        name: 'tags',
        url: '<?php echo $this->webroot; ?>admin/products/tagschanger',
        title: 'Tags',
        placement: 'left',
        source: [
            <?php foreach ($tags as $tag): ?>
            {id: '<?php echo $tag["Tag"]["name"]; ?>', text: '<?php echo $tag["Tag"]["name"]; ?>'},
            <?php endforeach; ?>
        ],
        select2: {
            multiple: true,
            allowClear: true,
            width: 300
        }
    });*/

});
</script>
<h2>Products</h2>

<?php   echo $this->Html->link(' Add New Product', array('action' => 'add'), array('class' => 'btn btn-default')); ?>
<br />
<br />


<br />

<?php //echo $this->element('pagination-counter'); ?>

<?php //echo $this->element('pagination'); ?>

<br />

<table class="table  table-bordered">
    <tr>
        <th><?php //echo $this->Paginator->sort('image'); ?></th>
        <th><?php //echo $this->Paginator->sort('category_id'); ?></th>
        <th><?php //echo $this->Paginator->sort('name'); ?></th>
        <th><?php //echo $this->Paginator->sort('active'); ?></th>
        <th><?php //echo $this->Paginator->sort('created'); ?></th>
        <th><?php //echo $this->Paginator->sort('modified'); ?></th>
        <th class="actions">Actions</th>
    </tr>
    <?php //foreach ($products as $product): ?>
    <tr>
        <td><?php //echo $this->Html->Image('/images/small/' . $product['Product']['image'], array('width' => 100, 'height' => 100, 'alt' => $product['Product']['image'], 'class' => 'image')); ?></td>
        <td><span class="category" data-value="<?php //echo $product['Category']['id']; ?>" data-pk="<?php //echo $product['Product']['id']; ?>"><?php //echo $product['Category']['name']; ?></span></td>
        <td><span class="name" data-value="<?php //echo $product['Product']['name']; ?>" data-pk="<?php //echo $product['Product']['id']; ?>"><?php //echo $product['Product']['name']; ?></span></td>
        <td><?php //echo h($product['Product']['active']); ?></td>
        <td><?php //echo h($product['Product']['created']); ?></td>
        <td><?php //echo h($product['Product']['modified']); ?></td>
        <td class="actions">
            <?php //echo $this->Html->link('View', array('action' => 'view', $product['Product']['id']), array('class' => 'btn btn-default btn-xs')); ?>
            <?php //echo $this->Html->link('Tags', array('action' => 'tags', $product['Product']['id']), array('class' => 'btn btn-default btn-xs')); ?>
            <?php //echo $this->Html->link('Edit', array('action' => 'edit', $product['Product']['id']), array('class' => 'btn btn-default btn-xs')); ?>
            <?php //echo $this->Form->postLink('Delete', array('action' => 'delete', $product['Product']['id']), array('class' => 'btn btn-danger btn-xs'), __('Are you sure you want to delete # %s?', $product['Product']['id'])); ?>
        </td>
    </tr>
    <?php //endforeach; ?>
</table>

<br />

<?php //echo $this->element('pagination-counter'); ?>

<?php echo $this->element('pagination'); ?>

<br />
<br />
<script >
    $(document).ready(function(){

    $('#ProductActive').change(function(){
        $('#ProductAdminSearchRedirectForm').submit();
    });

    });

</script>



