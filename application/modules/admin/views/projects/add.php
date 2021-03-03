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
							<?php endif;?>
							<?php echo form_open('admin/projects/create', array('id' => 'create_project', 'accept-charset' => 'utf-8')); ?>
								<div class="box-body">
									<div class="row">
										<div class="form-group col-md-6 col-sm-12">
											<label for=""> Project Name </label>
											<?php echo form_input(['name' => 'name', 'id' => 'name', 'placeholder' => 'Project Name', 'class' => 'form-control']); ?>
										</div>
										<div class="form-group col-md-6 col-sm-12">
											<label for=""> Project Name (Bangla) </label>
											<input type="text" class="form-control" id="name_BN" name="name_BN"  placeholder="">
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-2 col-sm-12">
											<label>Type</label>
											<select class="form-control" id="project_main_type" name="project_main_type" required>
												<option value="">Select</option>

												<?php foreach ($project_types as $project_type): ?>
													<option value="<?=$project_type['id']?>"><?=$project_type['name_BN']?></option>
												<?php endforeach;?>
											</select>
										</div>

										<div class="form-group col-md-2 col-sm-12">
											<label>Implementing partner</label>
											<select class="form-control" id="project_partner" name="project_partner" required>
												<option value="">Select</option>
												<?php foreach ($project_partners as $project_partner): ?>
													<option value="<?=$project_partner['id']?>"><?=$project_partner['name_BN']?></option>
												<?php endforeach;?>
											</select>
										</div>

										<div class="form-group col-md-2 col-sm-12">
											<label>Implementing Body</label>
											<select class="form-control" id="project_implementing_body" name="project_implementing_body">
    									<option value=""> Select </option>
    									<?php foreach ($get_implementing_bodies as $get_implementing_body): ?>
							        <option value="<?php echo $get_implementing_body['id']?>" <?php echo set_select('project_implementing_body', $get_implementing_body['id'], false)?>><?php echo $get_implementing_body['name_BN']?></option>
    									<?php endforeach; ?>
											</select>
										</div>

									</div>

									<div class="row">
										<div class="form-group col-md-4 col-sm-12">
											<label for="project_director_name"> Project Director (Name) </label>
											<?php
                                                    echo form_input(array('name' => 'project_director_name', 'class' => 'form-control'), set_value('project_director_name', $this->input->project_director_name));
                                            ?>
										</div>
										<div class="form-group col-md-4 col-sm-12">
											<label for=""> Project Director (Designation) </label>
											<input type="text" class="form-control" id="project_director_designation" name="project_director_designation" value="<?php echo set_value('project_director_designation', $this->input->project_director_designation) ?>" placeholder="">

										</div>
										<div class="form-group col-md-4 col-sm-12">
											<label for=""> Project Director (Contact) </label>
											<input type="text" class="form-control" id="project_director_contact" name="project_director_contact" value="<?php echo set_value('project_director_contact', $this->input->project_director_contact) ?>" placeholder="">
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-12">
											<input type="submit" id="submit" name="submit" value="Save" class="btn btn-primary">
											<input type="button" class="btn btn-danger" value="cancel" onClick="window.location.href='<?php echo base_url()."admin/projects";?>'" />
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

	<script>
		$(document).ready(function () {
			$('#project_main_type, #project_partner, #project_implementing_body').select2();
		});

	</script>
