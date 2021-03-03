<?php
if ($all) {
    $no = 1;
    $data = array();

    foreach ($all as $value) {
        $row = array();

        $id = $value['id'];

        $edt_url = base_url('admin/projects/edit_form/' . $id);

        $row[] = "<td>" . $no++ . "</td>";
        $row[] = "<td>" . $value['name_BN'] . "</td>";
        $row[] = "<td>" . $value['main_type_BN'] . "</td>";
        $row[] = "<td>" . $value['agency_name'] . "</td>";
        $row[] = "<td>" . $value['project_director_name'] . "</td>";
        $row[] = "<td>" . $value['project_director_phone_no'] . "</td>";
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
