<form id='create_product' action="" enctype="multipart/form-data" method="post"
      accept-charset="utf-8">
	<div class="box-body">
		<div id="status"></div>
		<div class="row">
		<div class="form-group col-md-8 col-sm-12">
			<label for=""> Product Name* </label>
			<input type="text" class="form-control" id="name" name="name" value=""
			       placeholder="">
			<span id="error_product_name" class="has-error"></span>
		</div>
		</div>

		<div class="row">
		<div class="form-group col-md-6 col-sm-12">
			<label>Product Category*</label>
			<select class="form-control" id="category_id" name="category_id" required>
				<option value="">Select</option>

				<?php foreach ($categories as $category): ?>
					<option value="<?=$category['id']?>"><?=$category['name']?></option>
				<?php endforeach;?>
			</select>
		</div>
		<div class="form-group col-md-6 col-sm-12">
			<label>Product Brand</label>
			<select class="form-control" id="brand_id" name="brand_id" required>
				<option value="">Select</option>

				<?php foreach ($brands as $brand): ?>
					<option value="<?=$brand['id']?>"><?=$brand['name']?></option>
				<?php endforeach;?>
			</select>
		</div>
		</div>
		<div class="row">
			<div class="form-group col-md-4 col-sm-12">
				<label for=""> Size </label>
				<input type="text" class="form-control" id="size" name="size" value=""
					   placeholder="">
			</div>
			<div class="form-group col-md-4 col-sm-12">
				<label for=""> Color </label>
				<input type="text" class="form-control" id="color" name="color" value=""
					   placeholder="">
			</div>
			<div class="form-group col-md-4 col-sm-12">
				<label for=""> Model </label>
				<input type="text" class="form-control" id="model" name="model" value=""
					   placeholder="">
			</div>
		</div>
		<div class="row">
		<div class="form-group col-md-4 col-sm-12">
			<label>Unit of Measures</label>
			<select class="form-control" id="uom_id" name="uom_id" required>
				<option value="">Select</option>

				<?php foreach ($uoms as $uom): ?>
					<option value="<?=$uom['id']?>"><?=$uom['name']?></option>
				<?php endforeach;?>
			</select>
		</div>

		<div class="form-group col-md-4 col-md-12">
		<label for=""> Opening Stock (Can not change it later) </label>
				<input type="text" class="form-control" id="stock_available" name="stock_available" value=""
					   placeholder="" required>
		</div>
		</div>
		<div class="row">
		<div class="form-group col-md-12">
			<input type="submit" id="submit" name="submit" value="Save" class="btn btn-primary">
			<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
			<small><img id="loader" src="<?php echo site_url('assets/images/loadingg.gif'); ?>"/></small>
		</div>
		</div>
	</div>
	<!-- /.box-body -->
</form>

<script>
	$(document).ready(function () {
		$('#loader').hide();
		// alert();
		$('#create_product').validate({// <- attach '.validate()' to your form
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

				var myData = new FormData($("#create_product")[0]);

				$.ajax({
					url: BASE_URL + 'admin/products/create',
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
							$("#create_product")[0].reset();
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
    $('#category_id, #brand_id, #uom_id').select2();
</script>
