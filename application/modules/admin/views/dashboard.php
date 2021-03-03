<?php
$products = $this->db->count_all('products');
$assets = $this->db->count_all('assets');
$sections = $this->db->count_all('sections');
$designations = $this->db->count_all('designations');
$employees = $this->db->count_all('employees');
?>
<div class="row">
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="col-md-12 col-sm-12  col-md-offset-4">
                    <h2 class="text-success">
                        ইনভেন্টরি ম্যানেজমেন্ট সফটওয়্যার
                     </h2>
                </div>
            </div>
        </div>
    </div>
</div>


                    <h2>Modules</h2>

<div class="row">
    <div class="col-md-2 col-sm-6 col-xs-12">
      <div class="info-box bg-red">
      <span class="info-box-icon"><span class="glyphicon glyphicon-list-alt"></span></span>
      <div class="info-box-content">
      <span class="info-box-text">মালামালের তালিকা
      <span class="info-box-number"><?=$products?></span>
      <span><a href=<?php echo site_url("admin/products"); ?> style="color: #FFFFFF" class="small-box-footer">দেখুন <i
                      class="fa fa-arrow-circle-right"></i></a></span>
      </div>
  <!-- /.info-box-content -->
      </div>
</div>

<div class="col-md-2 col-sm-6 col-xs-12">
      <div class="info-box bg-aqua">
      <span class="info-box-icon"><i class="fa fa-address-card"></i></span>
      <div class="info-box-content">
      <span class="info-box-text">স্থায়ী/অস্থায়ী সম্পদ</span>
      <span class="info-box-number"><?=$assets?> </span>
      <span><a href=<?php echo site_url("admin/assets"); ?>  style="color: #FFFFFF" class="small-box-footer">দেখুন <i
                      class="fa fa-arrow-circle-right"></i></a></span>
      </div>
      <!-- /.info-box-content -->
      </div>
</div>



<div class="col-md-2 col-sm-6 col-xs-12">
  <div class="info-box bg-yellow">
  <span class="info-box-icon"><i class="fa fa-calendar"></i></span>
  <div class="info-box-content">
  <span class="info-box-text">কর্মকর্তার তালিকা</span>
  <span class="info-box-number"><?=$employees?></span>
  <span><a href=<?php echo site_url("admin/employees"); ?>  style="color: #FFFFFF" class="small-box-footer">দেখুন <i
                  class="fa fa-arrow-circle-right"></i></a></span>
  </div>
</div>

</div>
<div class="col-md-2 col-sm-6 col-xs-12">
  <div class="info-box bg-purple">
  <span class="info-box-icon"><i class="fa fa-calendar"></i></span>
  <div class="info-box-content">
  <span class="info-box-text">শাখা/অধিশাখা</span>
  <span class="info-box-number"><?=$sections?></span>
  <span><a href=<?php echo site_url("admin/sections"); ?>  style="color: #FFFFFF" class="small-box-footer">দেখুন <i
                  class="fa fa-arrow-circle-right"></i></a></span>
  </div>
</div>

</div>
<div class="col-md-2 col-sm-6 col-xs-12">
  <div class="info-box bg-green">
  <span class="info-box-icon"><i class="fa fa-calendar"></i></span>
  <div class="info-box-content">
  <span class="info-box-text">পদবী</span>
  <span class="info-box-number"><?=$designations?></span>
  <span><a href=<?php echo site_url("admin/designations") ?>  style="color: #FFFFFF" class="small-box-footer">দেখুন <i
                  class="fa fa-arrow-circle-right"></i></a></span>
  </div>
</div>

</div>

<div class="col-md-2 col-sm-6 col-xs-12">
  <div class="info-box bg-yellow">
  <span class="info-box-icon"><i class="fa fa-calendar"></i></span>
  <div class="info-box-content">
  <span class="info-box-text">কর্মকর্তার তালিকা</span>
  <span class="info-box-number">64</span>
  <span><a href=<?php echo site_url("admin/employees"); ?>  style="color: #FFFFFF" class="small-box-footer"> দেখুন
                  <i class="fa fa-arrow-circle-right"></i></a></span>
  </div>
</div>
</div>
</div>
<div class="row">

<div class="col-md-2 col-sm-6 col-xs-12">
  <div class="info-box bg-yellow">
  <span class="info-box-icon"><i class="fa fa-calendar"></i></span>
  <div class="info-box-content">
  <span class="info-box-text"> মালামাল সরবরাহ </span>
  <span><a href=<?php echo site_url("admin/orders"); ?>  style="color: #FFFFFF" class="small-box-footer"> দেখুন
                  <i class="fa fa-arrow-circle-right"></i></a></span>
  </div>
</div>
</div>


<div class="col-md-2 col-sm-6 col-xs-12">
  <div class="info-box bg-yellow">
  <span class="info-box-icon"><i class="fa fa-calendar"></i></span>
  <div class="info-box-content">
  <span class="info-box-text"> মালামাল ক্রয় </span>
  <span><a href=<?php echo site_url("admin/purchases"); ?>  style="color: #FFFFFF" class="small-box-footer"> দেখুন
                  <i class="fa fa-arrow-circle-right"></i></a></span>
  </div>
</div>
</div>

</div>

                    <h2>
                        Reports
                     </h2>
                

<div class="row">
    <div class="col-md-2 col-sm-6 col-xs-12">
      <div class="info-box bg-red">
      <span class="info-box-icon"><span class="glyphicon glyphicon-book"></span></span>
      <div class="info-box-content">
      <span class="info-box-text">আইটেম ভিত্তিক মজুদ</span>
      <span class="info-box-text">শাখা ও তারিখ অনুযায়ী</span>
      <span><a href=<?php echo site_url("report/currentstock"); ?> style="color: #FFFFFF" class="small-box-footer">রিপোর্ট দেখুন<i
                      class="fa fa-arrow-circle-right"></i></a></span>
      </div>
  <!-- /.info-box-content -->
      </div>
</div>

<div class="col-md-2 col-sm-6 col-xs-12">
      <div class="info-box bg-aqua">
      <span class="info-box-icon"><span class="glyphicon glyphicon-list-alt"></span></span>
      <div class="info-box-content">
      <span class="info-box-text">মালামাল বিতরণ</span>
      <span class="info-box-text">শাখা ও আইটেম ভিত্তিক</span>
      <span><a href=<?php echo site_url("stockledgerreport"); ?>  style="color: #FFFFFF" class="small-box-footer">রিপোর্ট দেখুন
                  <i class="fa fa-arrow-circle-right"></i></a></span>
      </div>
      <!-- /.info-box-content -->
      </div>
</div>


<div class="col-md-2 col-sm-6 col-xs-12">
  <div class="info-box bg-yellow">
  <span class="info-box-icon"><i class="fa fa-calendar"></i></span>
  <div class="info-box-content">
  <span class="info-box-text">মালামাল বিতরণ<span>
      <span class="info-box-text">শাখা অনুযায়ী</span>
  <span><a href=<?php echo site_url("report/sectionwisedistribution"); ?>  style="color: #FFFFFF" class="small-box-footer">View Report <i
                  class="fa fa-arrow-circle-right"></i></a></span>
  </div>
</div>

</div>

<div class="col-md-2 col-sm-6 col-xs-12">
  <div class="info-box bg-purple">
  <span class="info-box-icon"><i class="fa fa-calendar"></i></span>
  <div class="info-box-content">
  <span class="info-box-text">অস্থাবর সম্পদের তালিকা<span>
      <span class="info-box-text">মোট</span>
  <span><a href=<?php echo site_url("report/totalassetcount"); ?>  style="color: #FFFFFF" class="small-box-footer">View Report <i
                  class="fa fa-arrow-circle-right"></i></a></span>
  </div>
</div>

</div>

</div>
