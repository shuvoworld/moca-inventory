<?php
$assets = $this->db->get('assets')->result_array();
?>
<div class="row">
<div class="col-md-8">
<form method='post' action="<?=base_url()?>report/totalassetcount" >
<div class="form-group col-md-4">
            <label>Asset's name</label>
            <select class="form-control select2-multiple" id="asset_id" name="asset_id[]" multiple = 'multiple'>
            <option value="">Select</option>
            <?php foreach ($assets as $asset): ?>
            <option value="<?=$asset['id']?>"><?=$asset['name']?></option>
            <?php endforeach;?>
            </select>
</div>

<div class="form-group pull-left col-md-12">
    <input type='submit' class="btn btn-primary" name='submit' value='Submit'>
</div>
</form>
</div>

</div>
<br/>
<?php //print_r($assetcounts); die();?>
  <div class="row">
        <div class="col-md-12 col-sm-12 table-responsive">
            <table class="table table-striped table-bordered" id="currentstock" style="width: 100%;">
                <thead>
                    <tr>
                    <th>Asset</th>
                    <th>Total Count</th>
                    </tr>
                </thead>
                <tbody>
                <?php if ($assets) {?>
                <?php foreach ($assetcounts as $assetcount) {?>
                  <tr>
                    <td><?php echo $assetcount->asset_name; ?></td>
                    <td><?php echo $assetcount->total_asset; ?></td>
                  </tr>
                <?php
}
} else {
    echo
        "<tr><td colspan='5'>No Record</td></tr>";
}
?>
                </tbody>
            </table>
        </div>
</div>
<div class="row">
<div class="col-md-8">
<form method='post' action="<?=base_url()?>report/Currentstock/exportCSV" >
  <div class="form-group pull-right col-md-12">
    <input type='submit' class="btn btn-info" name='export' value='Export All Data'>
  </div>
</form>
</div>
</div>
    <div class="row">
      <div class="col-sm-5">
        <div class="dataTables_info">
        <?php echo "Showing " . $x . " to " . $y . " of " . $config['total_rows'] . " entries"; ?>
      </div>
      </div>
      <div class="col-sm-7">
        <div class="dataTables_paginate paging_simple_numbers">
        <?php echo $link; ?>
       </div>
      </div>
    </div>
<script>
	$(document).ready(function () {
    $('.select2-multiple, .select2-single').select2({
    theme: 'bootstrap',
		placeholder: "Select",
		maximumSelectionSize: 6,
		containerCssClass: ':all:'
});
$('.datepicker').datepicker({
    format: 'yyyy-mm-dd',
});
});

</script>
