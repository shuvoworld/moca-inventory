<section class="sidebar fixed ">
    <!-- sidebar menu: : style can be found in sidebar.less -->
    <ul class="sidebar-menu">
        <!--        <li class="header">MAIN NAVIGATION</li>-->
        <li class="treeview">
            <a href="<?php echo site_url('admin/dashboard/index'); ?>">
                <i class="fa fa-home"></i> <span>ড্যাশবোর্ড</span>
            </a>
        </li>
        <?php if ($this->ion_auth->is_admin()): ?>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-users"></i>
                    <span>ব্যবহারকারী ব্যবস্থাপনা</span><i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li class="treeview">
                        <a href="<?php echo site_url('admin/user/'); ?>">
                            <i class="fa fa-edit"></i> <span>ইউসার</span>
                        </a>
                    </li>
                    <li class="treeview">
                        <a href="<?php echo site_url('admin/user_groups/'); ?>">
                            <i class="fa fa-edit"></i> <span>গ্রুপ</span>
                        </a>
                    </li>
                </ul>
            </li>

           <li class="treeview">
                <a href="#">
                    <i class="fa fa-users"></i>
                    <span>এডমিন</span><i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li class="treeview">
                        <a href="<?php echo site_url('admin/agencies/'); ?>">
                            <i class="fa fa-edit"></i> <span>দপ্তর/সংস্থা</span>
                        </a>
                    </li>
                    <li class="treeview">
                        <a href="<?php echo site_url('admin/projects/'); ?>">
                            <i class="fa fa-edit"></i> <span>প্রজেক্ট</span>
                        </a>
                    </li>
                    <li class="treeview">
                        <a href="<?php echo site_url('admin/categories'); ?>">
                            <i class="fa fa-tag"></i> <span>ক্যাটাগরি</span>
                        </a>
                    </li>
                    <li class="treeview">
                        <a href="<?php echo site_url('admin/brands'); ?>">
                            <i class="fa fa-tags"></i> <span>ব্র্যান্ড</span>
                        </a>
                    </li>
                
                    <li class="treeview">
                        <a href="<?php echo site_url('admin/suppliers'); ?>">
                            <span class="glyphicon glyphicon-user"></span> <span>সরবরাহকারী</span>
                        </a>
                    </li>
                    <li class="treeview">
                        <a href="<?php echo site_url('admin/sections'); ?>">
                            <span class="glyphicon glyphicon-user"></span> <span>শাখা</span>
                        </a>
                    </li>
                    <li class="treeview">
                        <a href="<?php echo site_url('admin/purchases'); ?>">
                            <i class="fa fa-cart-plus"></i> <span>ক্রয় অর্ডার</span>
                        </a>
                    </li>
                    <li class="treeview">
                        <a href="<?php echo site_url('admin/products'); ?>">
                            <i class="fa fa-gift"></i> <span>মালামাল</span>
                        </a>
                    </li>
                    <li class="treeview">
                        <a href="<?php echo site_url('admin/stocks'); ?>">
                            <i class="fa fa-gift"></i> <span>ট্র্যানজেকশন</span>
                        </a>
                    </li>

                    <li class="treeview">
                        <a href="<?php echo site_url('admin/settings/'); ?>">
                            <i class="fa fa-edit"></i> <span>সেটিংস</span>
                        </a>
                    </li>
                </ul>
            </li>
           <li class="treeview">
                <a href="#">
                    <i class="fa fa-users"></i>
                    <span>ক্রয় ব্যবস্থাপনা</span><i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li class="treeview">
                        <a href="<?php echo site_url('admin/purchases/'); ?>">
                            <i class="fa fa-edit"></i> <span>ক্রয় অর্ডার প্রস্তুত</span>
                        </a>
                    </li>
                    <li class="treeview">
                        <a href="<?php echo site_url('admin/stockins/'); ?>">
                            <i class="fa fa-edit"></i> <span>স্টক ইন</span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-users"></i>
                    <span>মালামাল বিতরণ</span><i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li class="treeview">
                        <a href="<?php echo site_url('admin/orders/'); ?>">
                            <i class="fa fa-edit"></i> <span>বিতরণ অর্ডার প্রস্তুত</span>
                        </a>
                    </li>
                    <li class="treeview">
                        <a href="<?php echo site_url('admin/stockouts/'); ?>">
                            <i class="fa fa-edit"></i> <span>স্টক আউট</span>
                        </a>
                    </li>
                </ul>
            </li>
        <?php endif;?>
    </ul>
</section>
<!-- /.sidebar -->
<script type="text/javascript">
    $(document).ready(function () {

        $('.sidebar ul li').each(function () {
            if (window.location.href.indexOf($(this).find('a:first').attr('href')) > -1) {
                $(this).closest('ul').closest('li').attr('class', 'active');
                $(this).addClass('active').siblings().removeClass('active');
            }
        });

    });
</script>