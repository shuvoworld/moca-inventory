<?php
if ($all) {

	$no = 1;
	$data = array();

	foreach ($all as $value) {

		$row = array();

		$id = $value['id'];

		$edt_url = base_url('admin/orders/edit_form/' . $id);

		$row[] = "<td>" . $no++ . "</td>";
		$row[] = "<td>" . $value['section'] . "</td>";
		$row[] = "<td>" . $value['order_date'] . "</td>";
		$row[] = "<td style='text-align:center;'><a href= '" . $edt_url . "' data-toggle='tooltip' class='btn btn-primary btn-xs edit'  id='" . $id . "' title='View'> <i class='glyphicon glyphicon-eye-open'></i> </a>
				  <!--<a data-toggle='tooltip' class='btn btn-danger btn-xs  delete'  id='" . $id . "' title='Delete'> <i class='fa fa-trash-o'></i> </a>--></td></tr>";

		$data[] = $row;
	}

} else {
	$data = "";
}
//output to json format
$output = array(
	"data" => $data,
);
echo json_encode($output);
