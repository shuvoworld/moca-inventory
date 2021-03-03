<?php
if ($single) {
    foreach ($single as $key => $value) {
    }
    ?>
   <div class="row">
   <div class="col-md-12">
   <div class="panel panel-default">
   <div class="panel-heading">
   <div class="panel-body">
   <div class="row">
   <?php if ($this->session->flashdata('success')): ?>
      <div class="alert alert-success alert-dismissible" role="alert">
      <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <?php echo $this->session->flashdata('success'); ?>
      </div>
      <?php elseif ($this->session->flashdata('error')): ?>
         <div class="alert alert-error alert-dismissible" role="alert">
         <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
         <?php echo $this->session->flashdata('error'); ?>
         </div>
         <?php endif;?>
         <?php echo form_open('admin/orders/edit', array('id' => 'edit_order', 'accept-charset' => 'utf-8')); ?>
         <div class="box-body">
         <div class="row">

         <div class="form-group col-md-2 col-sm-12">
			 <label for=""> Section </label>
			 <input type="text" class="form-control" id="section" name="section" readonly  value="<?php echo $section; ?>" placeholder="">
          </div>

            <div class="form-group col-md-2 col-sm-12">
            <label for=""> order Date </label>
            <input type="text" class="form-control" id="order_date" name="order_date" readonly  value="<?php echo $value['order_date']; ?>" placeholder="">
            <input type="hidden" name="updateId" id="updateId" value="<?php echo $value['id']; ?>">
            </div>
            </div>
            <div class = "row">
            <div class="form-group col-md-2 col-sm-12">
            <label for=""> GO/Memo No. </label>
            <input type="text" class="form-control" id="go_no" name="go_no"  value="<?php echo $value['go_no']; ?>" placeholder="" readonly>
            </div>

            <div class="form-group col-md-4 col-sm-12">
            <label for=""> Note </label>
            <input type="text" class="form-control" id="note" name="note"  value="<?php echo $value['note']; ?>" placeholder="" readonly>
            </div>

            </div>
            </div>
	   <br /> <br/>
	   <table class="table table-bordered" id="product_info_table">
		   <thead>
		   <tr>
			   <th style="width:50%">Product</th>
			   <th style="width:10%">Quantity</th>
		   </tr>
		   </thead>

		   <tbody>
		   <?php if (isset($order_data['order_item'])): ?>
			   <?php $x = 1;?>
			   <?php foreach ($order_data['order_item'] as $key => $val): ?>
				   <?php //print_r($v); ?>
				   <tr id="row_<?php echo $x; ?>">
					   <td>
						   <select class="form-control select_group product" disabled data-row-id="row_<?php echo $x; ?>" id="product_<?php echo $x; ?>" name="product[]" style="width:100%;" required>
							   <option value=""></option>
							   <?php foreach ($products as $k => $v): ?>
								   <option value="<?php echo $v['id'] ?>" <?php if ($val['product_id'] == $v['id']) {echo "selected='selected'";}?>><?php echo $v['name'] ?></option>
							   <?php endforeach?>
						   </select>
					   </td>
					   <td><input type="text" name="qty[]" disabled id="qty_<?php echo $x; ?>" class="form-control" required  value="<?php echo $val['quantity'] ?>" autocomplete="off"></td>
					 <!--  <td><button type="button" class="btn btn-danger btn-sm" onclick="removeRow('<?php echo $x; ?>')"><i class="fa fa-close"></i></button></td> -->
				   </tr>
				   <?php $x++;?>
			   <?php endforeach;?>
		   <?php endif;?>
		   </tbody>
	   </table>
            <div class="row">
				<div class="form-group col-md-12">
				<input type="submit" id="submit" name="submit" value="Save" class="btn btn-primary">
				<input type="button" class="btn btn-danger" value="cancel" onClick="window.location.href='<?php echo base_url() . "admin/orders"; ?>'" />
			</div>


		</div>
		<!-- /.box-body -->
	<?php echo form_close(); ?>
	<?php
} else {
    echo "Sorry!! no records found to edit";
}
?>

	   <script>
           var base_url = "<?php echo base_url(); ?>";
           function removeRow(tr_id)
           {
               $("#product_info_table tbody tr#row_"+tr_id).remove();
           }
           $(document).ready(function () {
               $('.select_group').select2();
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

