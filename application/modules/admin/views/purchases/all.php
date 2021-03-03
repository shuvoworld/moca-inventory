<?php
if ($all) {
    $no = 1;
    $data = array();

    foreach ($all as $value) {
        $row = array();

        $id = $value['id'];

        $edt_url = base_url('admin/purchases/edit_form/' . $id);

        $row[] = "<td>" . $no++ . "</td>";
        $row[] = "<td>" . $value['supplier'] . "</td>";
        $row[] = "<td>" . $value['purchase_date'] . "</td>";
        $row[] = "<td style='text-align:center;'><a href= '" . $edt_url . "' data-toggle='tooltip' class='btn btn-primary btn-xs edit'  id='" . $id . "' title='Edit'> <i class='fa fa-pencil-square-o'></i> </a>
		<a data-toggle='tooltip' class='btn btn-danger btn-xs  delete'  id='" . $id . "' title='Delete'> <i class='fa fa-trash-o'></i> </a></td></tr>";

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
