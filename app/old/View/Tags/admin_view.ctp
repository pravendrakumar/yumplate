<h2>Tag</h2>

<br />
<br />
<script>
function goBack() {
    window.history.back()
}
</script>
<button onclick="goBack()" class="btn btn-primary">Back</button>
<br />
<br />
<table class="table-striped table-bordered table-condensed table-hover">
    <tr>
        <td>Id</td>
        <td><?php echo h($tag['Tag']['id']); ?></td>
    </tr>
    <tr>
        <td>Name</td>
        <td><?php echo h($tag['Tag']['name']); ?></td>
    </tr>
    <tr>
        <td>Created</td>
        <td><?php echo h($tag['Tag']['created']); ?></td>
    </tr>
    <tr>
        <td>Modified</td>
        <td><?php echo h($tag['Tag']['modified']); ?></td>
    </tr>
</table>

<br />
<br />