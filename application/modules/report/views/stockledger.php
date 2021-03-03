<?php
$sections = $this->db->get('sections')->result_array();
$products = $this->db->get('products')->result_array();
?>

<form method='post' action="<?=base_url()?>stockledgerreport" >
  <div class="form-group col-md-2">
      <label>Sections</label>
      <select class="form-control select2-single" id="section_id" name="section_id">
      <option value="">Select</option>
      <?php foreach ($sections as $section): ?>
      <option value="<?=$section['id']?>"><?=$section['name']?></option>
      <?php endforeach;?>
      </select>
  </div>
<div class="form-group col-md-2">
            <label>Product</label>
            <select class="form-control select2-multiple" id="product_id" name="product_id[]" multiple = 'multiple'>
            <option value="">Select</option>
            <?php foreach ($products as $product): ?>
            <option value="<?=$product['id']?>"><?=$product['name']?></option>
            <?php endforeach;?>
            </select>
</div>

<div class="btn-group pull-left cta-block no-margin col-md-12">
            <input type='submit' class="btn btn-primary" name='submit' value='Submit'>
</div>
    </form>

<br/>
  <div class="row">
        <div class="col-md-12 col-sm-12 table-responsive">
            <table class="table table-striped table-bordered" style="width: 100%;">
                <thead>
                    <tr>
                    <th>#ID</th>
                    <th>Product</th>
                    <th>Section</th>
                    <th>Quantity</th>
                    <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                <?php if ($stocks) {?>
                <?php foreach ($stocks as $stock) {?>
                  <tr>
                    <td><?php echo $stock->id; ?></td>
                    <td><?php echo $stock->product_name; ?></td>
                    <td><?php echo $stock->section; ?></td>
                    <td><?php echo $stock->quantity; ?></td>
                    <td><?php echo $stock->date; ?></td>
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
});
</script>
