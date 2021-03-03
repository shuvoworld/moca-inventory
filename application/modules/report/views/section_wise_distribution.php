<?php
$sections = $this->db->get('sections')->result_array();
$products = $this->db->get('products')->result_array();
?>
<div class="row">
<div class="col-md-12">
<form method='post' action="<?=base_url()?>report/sectionwisedistribution" class="form-inline">
  <div class="form-group">
      <select class="form-control select2-single" id="section_id" name="section_id">
      <option value="">Select</option>
      <?php foreach ($sections as $section): ?>
      <option value="<?=$section['id']?>"><?=$section['name']?></option>
      <?php endforeach;?>
      </select>
  </div>
<div class="form-group">
            <input type="text" name="from_orderdate" id="from_orderdate" class="form-control datepicker" placeholder="Enter From Date" />
</div>

<div class="form-group">
            <input type="text" name="to_orderdate" id="to_orderdate" class="form-control datepicker"  placeholder="Enter To Date" />
</div>

            <input type='submit' class="btn btn-info" name='submit' value='Show Section Wise Report'>

</form>
</div>
</div>
<br/>
  <div class="row">
        <div class="col-md-12 col-sm-12 table-responsive">
            <table class="table table-striped table-bordered" style="width: 100%;">
                <thead>
                    <tr>
                    <th>Section</th>
                    <th>Product</th>
                    <th>Total Product Recieved Between Selected Date</th>
                    </tr>
                </thead>
                <tbody>
                <?php if ($distribution_summary) {?>
                <?php foreach ($distribution_summary as $summary) {?>
                  <tr>
                    <td><?php echo $summary->section; ?></td>
                    <td><?php echo $summary->product_name; ?></td>
                    <td><?php echo $summary->summary; ?></td>
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
		placeholder: "Select Section",
    width: 'resolve'
});

$('.datepicker').datepicker({
			autoclose: true,
			format: "yyyy-mm-dd",
			todayHighlight: true,
			orientation: "top auto",
			todayBtn: true,
			todayHighlight: true,
		});
});
</script>
