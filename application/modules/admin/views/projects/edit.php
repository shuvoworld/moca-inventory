<?php
if ($single) {
    foreach ($single as $key => $value) {
    } ?>
	<!-- To do: value doesn't sustain in form field when validation fails -->
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
								<?php endif; ?>
								<form id='edit_projects' action="<?php echo base_url('admin/projects/edit'); ?>" enctype="multipart/form-data" method="post" accept-charset="utf-8">
									<div class="box-body">
										<div class="box-body">
											<div id="status"></div>
											<div class="row">
												<div class="form-group col-md-6 col-sm-12">
													<label for=""> Project Name </label>
													<input type="text" class="form-control" id="name" name="name" value="<?php echo $value['name']; ?>" placeholder="">
													<input type="hidden" name="updateId" id="updateId" value="<?php echo $value['id']; ?>">
												</div>
												<div class="form-group col-md-6 col-sm-12">
													<label for=""> Project Name (Bangla) </label>
													<input type="text" class="form-control" id="name_BN" name="name_BN" value="<?php echo $value['name_BN']; ?>" placeholder="">
												</div>
											</div>
											<div class="row">
												<div class="form-group col-md-2 col-sm-12">
													<label>Type</label>
													<select class="form-control" id="project_main_type" name="project_main_type" required>
														<option value="">Select</option>

														<?php foreach ($project_types as $project_type): ?>
															<option value="<?=$project_type['id']?>" <?php if ($value['main_type_id'] == $project_type['id']): echo "selected";
    endif; ?> >
																<?=$project_type['name_BN']?>
															</option>
														<?php endforeach; ?>
													</select>
												</div>

												<div class="form-group col-md-2 col-sm-12">
													<label>Implementing partner</label>
													<select class="form-control" id="project_partner" name="project_partner" required>
														<option value="">Select</option>
														<?php foreach ($project_partners as $project_partner): ?>
															<option value="<?=$project_partner['id']?>" <?php if ($value['agency_id'] == $project_partner['id']): echo "selected";
    endif; ?> >
																<?=$project_partner['name_BN']?>
															</option>
														<?php endforeach; ?>
													</select>
												</div>

												<div class="form-group col-md-2 col-sm-12">
													<label>Implementing Body</label>
													<select class="form-control" id="project_implementing_body" name="project_implementing_body" required>
														<option value="">Select</option>
														<?php foreach ($get_implementing_bodies as $get_implementing_body): ?>
															<option value="<?=$get_implementing_body['id']?>" <?php if ($value['agency_id'] == $get_implementing_body['id']): echo "selected";
    endif; ?> >
																<?=$get_implementing_body['name_BN']?>
															</option>
														<?php endforeach; ?>
													</select>
												</div>

											</div>
											<div class="row">
												<div class="form-group col-md-4 col-sm-12">
													<label for=""> Project Director (Name) </label>
													<input type="text" class="form-control" value="<?php echo $value['project_director_name']; ?>" id="project_director_name" name="project_director_name" value=""
													placeholder="">
													<span id="error_project_director_name" class="has-error"></span>
												</div>
												<div class="form-group col-md-4 col-sm-12">
													<label for=""> Project Director (Designation) </label>
													<input type="text" class="form-control" value="<?php echo $value['project_director_designation']; ?>" id="project_director_designation" name="project_director_designation" value=""
													placeholder="">
													<span id="error_project_director_designation" class="has-error"></span>
												</div>
												<div class="form-group col-md-4 col-sm-12">
													<label for=""> Project Director (Contact) </label>
													<input type="text" class="form-control" id="project_director_phone_no" name="project_director_phone_no" value="<?php echo $value['project_director_phone_no']; ?>"
													placeholder="">
													<span id="error_project_director_contact" class="has-error"></span>
												</div>
											</div>
											<div class="row">
												<div class="form-group col-md-12">
													<input type="submit" id="submit" name="submit" value="Save" class="btn btn-primary">
													<input type="button" class="btn btn-danger" value="cancel" onClick="window.location.href='<?php echo base_url()."admin/projects"; ?>'" />
												</div>
											</div>
										</div>
										<!-- /.box-body -->
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<?php
} else {
        echo "Sorry!! no records found to edit";
    }
?>

		<script>
			$(document).ready(function () {
				$('#project_main_type, #project_partner, #project_implementing_body').select2();
			});

		</script>
