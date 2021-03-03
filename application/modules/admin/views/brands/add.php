<form id='create_category' action="" enctype="multipart/form-data" method="post"
      accept-charset="utf-8">
	<div class="box-body">
		<div id="status"></div>
		<div class="form-group col-md-6 col-sm-12">
			<label for=""> Name </label>
			<input type="text" class="form-control" id="name" name="name" value=""
			       placeholder="">
			<span id="error_category_name" class="has-error"></span>
		</div>
		<div class="form-group col-md-12">
			<input type="submit" id="submit" name="submit" value="Save" class="btn btn-primary">
			<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
			<small><img id="loader" src="<?php echo site_url('assets/images/loadingg.gif'); ?>"/></small>
		</div>
	</div>
	<!-- /.box-body -->
</form>

<script>
	$(document).ready(function () {
		$('#loader').hide();
		// alert();
		$('#create_category').validate({// <- attach '.validate()' to your form
			// Rules for form validation
			rules: {
				name: {
					required: true
				}
			},
			// Messages for form validation
			messages: {
				name_BN: {
					required: 'Please enter Bangla name'
				},
				name: {
					required: 'Please enter English name'
				}
			},
			submitHandler: function (form) {

				var myData = new FormData($("#create_category")[0]);

				$.ajax({
					url: BASE_URL + 'admin/brands/create',
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

							$('#modalAgency').modal('hide'); // hide bootstrap modal
							notify_view(data.type, data.message);
							reload_table();

							$('#loader').hide();
							$("#submit").prop('disabled', false); // disable button
							$("html, body").animate({scrollTop: 0}, "slow");
							$("#create_group")[0].reset();

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
