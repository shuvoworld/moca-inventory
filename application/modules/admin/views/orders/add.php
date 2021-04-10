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
		<?php echo form_open('admin/orders/create', array('id' => 'create_order', 'accept-charset' => 'utf-8')); ?>
		<div class="box-body">
		<div class="row">

		<div class="form-group col-md-2 col-sm-12">
		<label>section</label>
			<select class="form-control select2" id="section_id" name="section_id" required style="width: 100%;>
		<option value="">নির্বাচন করুন</option>

		<?php foreach ($sections as $section): ?>
			<option value="<?=$section['id']?>"><?=$section['name']?></option>
			<?php endforeach;?>
			</select>
			</div>

			<div class="form-group col-md-2 col-sm-12">
			<label for=""> order Date </label>
			<?php echo form_input(['name' => 'order_date', 'id' => 'order_date', 'class' => 'form-control datepicker']); ?>
			</div>

			<div class="form-group col-md-2 col-sm-12">
			<label for=""> Reference Memo No. </label>
			<?php echo form_input(['name' => 'go_no', 'id' => 'go_no', 'placeholder' => '', 'class' => 'form-control']); ?>
			</div>

			<div class="form-group col-md-4 col-sm-12">
			<label for=""> Note </label>
			<?php echo form_input(['name' => 'note', 'id' => 'go_no', 'placeholder' => '', 'class' => 'form-control']); ?>
			</div>

			</div>
			<br /> <br/>
			<table class="table table-bordered" id="product_info_table">
			<thead>
			<tr>
			<th style="width:50%">Product</th>
			<th style="width:10%">Quantity</th>
			<th style="width:10%"><button type="button" id="add_row" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></button></th>
			</tr>
			</thead>

			<tbody>
			<tr id="row_1">
			<td>
			<select class="form-control select2 product" data-row-id="row_1" id="product_1" name="product[]" style="width:100%;">
			<option value="">নির্বাচন করুন</option>
				<?php foreach ($products as $k => $v): ?>
				<option value="<?php echo $v['id'] ?>"><?php echo $v['name'] . " == বর্তমান মজুদ => " . $v['stock_available'] ?></option>
				<?php endforeach?>
				</select>
				</td>
				<td><input type="number" name="qty[]" id="qty_1" class="form-control" required></td>
				<td><button type="button" class="btn btn-danger btn-sm" onclick="removeRow('1')"><i class="fa fa-close"></i></button></td>
				</tr>
				</tbody>
				</table>

				<div class="row">
				<div class="form-group col-md-4 col-sm-12">
				<input type="submit" id="submit" name="submit" value="Create Order" class="btn btn-primary">
					<input type="button" class="btn btn-danger" value="cancel" onClick="window.location.href='<?php echo base_url() . "admin/orders"; ?>'" />
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
	var base_url = "<?php echo base_url(); ?>";
	function removeRow(tr_id)
		{
			$("#product_info_table tbody tr#row_"+tr_id).remove();
		}
	$(document).ready(function () {

		// Add new row in the table
		$("#add_row").unbind('click').bind('click', function() {
			var table = $("#product_info_table");
			var count_table_tbody_tr = $("#product_info_table tbody tr").length;
			var row_id = count_table_tbody_tr + 1;

			$.ajax({
				url: base_url + 'restserver/api/products',
				type: 'GET',
				dataType: 'json',
				success:function(response) {
					// console.log(reponse.x);
					var html = '<tr id="row_'+row_id+'">'+
					'<td>'+
					'<select class="form-control select2select2 product" data-row-id="'+row_id+'" id="product_'+row_id+'" name="product[]" style="width:100%;">'+
					'<option value="">নির্বাচন করুন</option>';
					$.each(response, function(index, value) {
						html += '<option value="'+value.id+'">'+value.name+'</option>';
					});

					html += '</select>'+
					'</td>'+
					'<td><input type="number" name="qty[]" id="qty_'+row_id+'" class="form-control"></td>'+
					'<td><button type="button" class="btn btn-danger btn-sm" onclick="removeRow(\''+row_id+'\')"><i class="fa fa-close"></i></button></td>'+
					'</tr>';

					if(count_table_tbody_tr >= 1) {
						$("#product_info_table tbody tr:last").after(html);
					}
					else {
						$("#product_info_table tbody").html(html);
					}

					$(".product").select2();

				}
			});

			return false;
		});

		$('.select2,  #product_1').select2();
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
