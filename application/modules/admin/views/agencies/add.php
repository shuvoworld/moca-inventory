<form id='create_agency' action="" enctype="multipart/form-data" method="post"
      accept-charset="utf-8">
	<div class="box-body">
		<div id="status"></div>
		<div class="form-group col-md-6 col-sm-12">
			<label for=""> Agency Name </label>
			<input type="text" class="form-control" id="name" name="name" value=""
			       placeholder="">
			<span id="error_agency_name" class="has-error"></span>
		</div>
		<div class="form-group col-md-6 col-sm-12">
			<label for=""> Agency Name (Bangla) </label>
			<input type="text" class="form-control" id="name_BN" name="name_BN" value=""
			       placeholder="">
			<span id="error_name_BN" class="has-error"></span>
		</div>
		<div class="form-group col-md-6 col-sm-12">
			<label for=""> Agency Head Name</label>
			<input type="text" class="form-control" id="head_name" name="head_name" value=""
			       placeholder="">
			<span id="error_head_name" class="has-error"></span>
		</div>
		<div class="form-group col-md-6 col-sm-12">
			<label for=""> Agency Head (Designation) </label>
			<input type="text" class="form-control" id="head_designation" name="head_designation" value=""
			       placeholder="">
			<span id="error_head_designation" class="has-error"></span>
		</div>
		<div class="form-group col-md-6 col-sm-12">
			<label for=""> Agency Head (Contact) </label>
			<input type="text" class="form-control" id="contact_info" name="contact_info" value=""
			       placeholder="">
			<span id="error_contact_info" class="has-error"></span>
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
		$('#create_agency').validate({// <- attach '.validate()' to your form
			// Rules for form validation
			rules: {
				name_BN: {
					required: true
				},
				name:{
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

				var myData = new FormData($("#create_agency")[0]);

				$.ajax({
					url: BASE_URL + 'admin/agencies/create',
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
							$('#loader').hide();
							$("#submit").prop('disabled', false); // disable button
							$("html, body").animate({scrollTop: 0}, "slow");
							$("#create_agency")[0].reset();
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
