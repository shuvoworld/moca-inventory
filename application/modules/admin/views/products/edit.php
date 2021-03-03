<?php
if ($single) {
    foreach ($single as $key => $value) {
    }?>
	<form id='edit_product' action="" enctype="multipart/form-data" method="post"
	      accept-charset="utf-8">
		<div class="box-body">
			<div class="row">
			<div class="form-group col-md-6 col-sm-12">
				<label for=""> Product Name </label>
				<input type="text" class="form-control" id="name" name="name"
				       value="<?php echo $value['name']; ?>"
				       placeholder="">
				<input type="hidden" name="updateId" id="updateId" value="<?php echo $value['id']; ?>">
			</div>
			</div>
			<div class="row">
				<div class="form-group col-md-6 col-sm-12">
					<label>Product Category</label>
					<select class="form-control" id="category_id" name="category_id" required>
						<option value="">Select</option>

						<?php foreach ($categories as $category): ?>
							<option value="<?=$category['id']?>" <?php if ($value['category_id'] == $category['id']): echo "selected";
    endif;?> >
								<?=$category['name']?>
							</option>
						<?php endforeach;?>
					</select>
				</div>
				<div class="form-group col-md-6 col-sm-12">
					<label>Product Brand</label>
					<select class="form-control" id="brand_id" name="brand_id" required>
						<option value="">Select</option>

						<?php foreach ($brands as $brand): ?>
							<option value="<?=$brand['id']?>" <?php if ($value['brand_id'] == $brand['id']): echo "selected";
    endif;?> >
								<?=$brand['name']?>
							</option>
						<?php endforeach;?>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-4 col-sm-12">
					<label for=""> Size </label>
					<input type="text" class="form-control" id="size" name="size"  value="<?php echo $value['size']; ?>" placeholder="">
				</div>
				<div class="form-group col-md-4 col-sm-12">
					<label for=""> Color </label>
					<input type="text" class="form-control" id="color" name="color"  value="<?php echo $value['color']; ?>" placeholder="">
				</div>
				<div class="form-group col-md-4 col-sm-12">
					<label for=""> Model </label>
					<input type="text" class="form-control" id="model" name="model"  value="<?php echo $value['model']; ?>" placeholder="">
				</div>
				<div class="row">
				<div class="form-group col-md-4 col-sm-12">
					<label>Unit of Measures</label>
					<select class="form-control" id="uom_id" name="uom_id" required>
						<option value="">Select</option>
						<?php foreach ($uoms as $uom): ?>
							<option value="<?=$brand['id']?>" <?php if ($value['uom_id'] == $uom['id']): echo "selected";endif;?> >
								<?=$uom['name']?>
							</option>
						<?php endforeach;?>
					</select>
				</div>
				<div class="form-group col-md-4 col-sm-12">
					<label for=""> Opening Stock </label>
					<input type="text" class="form-control" id="stock_available" name="stock_available"  value="<?php echo $value['stock_available']; ?>" placeholder="">
				</div>
				</div>

			</div>
			<div class="row">
			<div class="form-group col-md-12">
				<input type="submit" id="submit" name="submit" value="Save" class="btn btn-primary">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
				<small><img id="loader" src="<?php echo site_url('assets/images/loadingg.gif'); ?>"/></small>
			</div>
<div>
		</div>
		<!-- /.box-body -->
	</form>
	<?php
} else {
    echo "Sorry!! no records found to edit";
}
?>
<script type="text/javascript">
$('#category_id, #brand_id').select2();
    function reload_table() {
        table.ajax.reload(null, false); //reload datatable ajax
    }
	//Flat red color scheme for iCheck
	$('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
		checkboxClass: 'icheckbox_flat-green',
		radioClass: 'iradio_flat-green'
	});

</script>

<script>
	$(document).ready(function () {

		$('#loader').hide();
		// alert();
		$('#edit_product').validate({// <- attach '.validate()' to your form
			// Rules for form validation
			rules: {
				name: {
					required: true
				}
			},
			// Messages for form validation
			messages: {
				name: {
					required: 'Please enter name'
				}
			},
			submitHandler: function (form) {

				var myData = new FormData($("#edit_product")[0]);

				$.ajax({
					url: BASE_URL + 'admin/products/edit',
					type: 'POST',
					data: myData,
					dataType: 'json',
					cache: false,
					processData: false,
					contentType: false,
					beforeSend: function () {
						$('#loader').show();
						$("#submit").prop('disabled', true); // disable button
					},
					success: function (data) {
						if (data.type === 'success') {
							$('#modalProduct').modal('hide'); // hide bootstrap modal
							$('#loader').hide();
							$("#submit").prop('disabled', false); // disable button
							$("html, body").animate({scrollTop: 0}, "slow");
                            $("#edit_product")[0].reset();
							reload_table();
							notify_view(data.type, data.message);
						} else if (data.type === 'danger') {
							if (data.errors) {
								$.each(data.errors, function (key, val) {
									$('#error_' + key).html(val);
								});
							}
							$("#status").html(data.message);
							$('#loader').hide();
							$("#submit").prop('disabled', false); // disable button
							$("html, body").animate({scrollTop: 0}, "slow");

						}
					}
				});
			}
			// <- end 'submitHandler' callback
		});                    // <- end '.validate()'

	});

</script>
