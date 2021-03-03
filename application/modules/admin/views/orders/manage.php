
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<?php if ($this->session->flashdata('success')): ?>
					<div class="alert alert-success alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<?php echo $this->session->flashdata('success'); ?>
					</div>
					<?php elseif ($this->session->flashdata('error')): ?>
						<div class="alert alert-error alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<?php echo $this->session->flashdata('error'); ?>
						<?php endif;?>
							<a href="<?php echo base_url('admin/orders/create_form') ?>" class="btn btn-success" style="color: #FFFFFF"><i class="glyphicon glyphicon-plus"></i>&nbsp; অর্ডার প্রস্তুত করুন</a>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-12 col-sm-12 table-responsive">
								<table id="manage_all" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th> শাখা</th>
											<th> তারিখ</th>
											<th> Action</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>#</th>
											<th> শাখা</th>
											<th> তারিখ</th>
											<th> Action</th>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<style>
			@media screen and (min-width: 768px) {
				#modalGroup .modal-dialog {
					width: 60%;
					border-radius: 5px;
				}
			}
		</style>
		<script>
			$(document).ready(function () {

				table = $('#manage_all').DataTable({
					dom: "<'row'<'col-sm-4'l><'col-sm-8'f>>" +
            "<'row'<'col-sm-12'>>" + //
            "<'row'<'col-sm-12'tr>>" +
            "<'row'<'col-sm-4'i><'col-sm-8'p>>",

            //"lengthMenu": [[10, 15, 25, 50, -1], [10, 15, 25, 50, "All"]],

            "autoWidth": false,

            "ajax": {
            	"url": BASE_URL + 'admin/orders/get_all',
            	"type": "POST"
            },

            buttons: [
            {
            	extend: 'excelHtml5',
            	text: '<i class="fa fa-table"> EXCEL </i>',
            	titleAttr: 'Excel',
            	exportOptions: {
            		columns: ':visible:not(.not-exported)'
            	}
            },
            {
            	extend: 'pdfHtml5',
            	text: '<i class="fa fa-file-pdf-o"> PDF</i>',
            	titleAttr: 'PDF',
            	exportOptions: {
            		columns: ':visible'
            	}
            },
            {
            	extend: 'print',
            	text: '<i class="fa fa-print"> PRINT </i>',
            	titleAttr: 'Print',
            	exportOptions: {
            		columns: ':visible'
            	}

            },
            {
            	extend: 'colvis',
            	text: '<i class="fa fa-eye-slash"> Column Visibility </i>',
            	titleAttr: 'Visibility'
            }


            ],

            "oSelectorOpts": {filter: 'applied', order: "current"},
            language: {
            	buttons: {},

            	"emptyTable": "<strong style='color:#ff0000'> Sorry!!! No Records have found </strong>",
            	"search": "",
            	"paginate": {
            		"next": "Next",
            		"previous": "Previous"
            	},

            	"zeroRecords": ""
            }
        });


				$('.dataTables_filter input[type="search"]').attr('placeholder', 'Search...').css({'width': '220px'});

				$('[data-toggle="tooltip"]').tooltip();

			});
		</script>

		<script type="text/javascript">
		function reload_table() {
				table.ajax.reload(null, false); //reload datatable ajax
		}
			$(document).ready(function () {
				$("#manage_all").on("click", ".delete", function () {
					var id = $(this).attr('id');
					swal({
						title: "Are you sure?",
						text: "You will not be able to recover this record!",
						type: "warning",
						showCancelButton: true,
						closeOnConfirm: false,
						showLoaderOnConfirm: true,
						confirmButtonClass: "btn-danger",
						confirmButtonText: "Yes, delete it!"
					}, function () {
						$.ajax({
							type: 'POST',
							url: BASE_URL + 'admin/orders/delete',
							dataType: 'json',
							data: 'id=' + id,
							success: function (data) {

								if (data.type === 'success') {

									swal("Done!", "It was succesfully deleted!", "success");
									reload_table();

								} else if (data.type === 'danger') {

									swal("Error deleting!", "Please try again", "error");

								}
							},
							error: function (xhr, ajaxOptions, thrownError) {
								swal("Error deleting!", "Please try again", "error");
							}
						});
					});
				});
			});

		</script>
