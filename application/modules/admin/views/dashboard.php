<?php
$categories = $this->db->count_all('categories');
$products = $this->db->count_all('products');
$assets = $this->db->count_all('assets');
$sections = $this->db->count_all('sections');
$designations = $this->db->count_all('designations');
$employees = $this->db->count_all('employees');
?>


<div class="row">

  <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3><?=$products?></h3>
              <p>মালামালের তালিকা</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href=<?php echo site_url("admin/products"); ?> style="color: #FFFFFF" class="small-box-footer">দেখুন <i
                      class="fa fa-arrow-circle-right"></i></a>
          </div>
  </div>

  <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3><?=$assets?></h3>

              <p>স্থায়ী/অস্থায়ী সম্পদ</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href=<?php echo site_url("admin/assets"); ?>  style="color: #FFFFFF" class="small-box-footer">দেখুন <i
                      class="fa fa-arrow-circle-right"></i></a>
          </div>
  </div>

  <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3><?=$employees?></h3>

              <p>কর্মকর্তার তালিকা</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href=<?php echo site_url("admin/employees"); ?>  style="color: #FFFFFF" class="small-box-footer">দেখুন <i
                  class="fa fa-arrow-circle-right"></i></a>
          </div>
  </div>

  <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3><?=$sections?></h3>

              <p>শাখা/অধিশাখা</p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href=<?php echo site_url("admin/sections"); ?>  style="color: #FFFFFF" class="small-box-footer">দেখুন <i
                  class="fa fa-arrow-circle-right"></i></a>
          </div>
  </div>
</div>
  
<div class="row">
  <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3><?=$categories?></h3>

              <p>মালামালের ক্যটাগরি</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href=<?php echo site_url("admin/categories"); ?>  style="color: #FFFFFF" class="small-box-footer">দেখুন <i
                  class="fa fa-arrow-circle-right"></i></a>
          </div>
  </div>

  <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3><?=$designations?></h3>

              <p>পদবী</p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href=<?php echo site_url("admin/designations") ?>  style="color: #FFFFFF" class="small-box-footer">দেখুন <i
                  class="fa fa-arrow-circle-right"></i></a>
          </div>
  </div>
</div>

<h2>সরবরাহ ও ক্রয়</h2>
<div class="row">
<div class="col-md-2 col-sm-6 col-xs-12">
  <div class="info-box bg-red">
  <span class="info-box-icon"><i class="fa fa-calendar"></i></span>
  <div class="info-box-content">
  <span class="info-box-text"> মালামাল সরবরাহ </span>
  <span><a href=<?php echo site_url("admin/orders"); ?>  style="color: #FFFFFF" class="small-box-footer">তালিকা দেখুন
                  <i class="fa fa-arrow-circle-right"></i></a></span>
  </div>
</div>
</div>


<div class="col-md-2 col-sm-6 col-xs-12">
  <div class="info-box bg-green">
  <span class="info-box-icon"><i class="fa fa-calendar"></i></span>
  <div class="info-box-content">
  <span class="info-box-text"> মালামাল ক্রয় </span>
  <span><a href=<?php echo site_url("admin/purchases"); ?>  style="color: #FFFFFF" class="small-box-footer"> তালিকা দেখুন
                  <i class="fa fa-arrow-circle-right"></i></a></span>
  </div>
</div>
</div>

</div>

<h2>রিপোর্ট</h2>
                
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