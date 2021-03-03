<div class="limiter">
    <div class="container-login100" style="background-image: url('<?php echo base_url(); ?>assets/images/pngkey.com-design-png-17479.png'); background-repeat: no-repeat;">
        <div class="wrap-login100">
            <div class="login100-form-title">
              <img src="<?php echo base_url(); ?>assets/images/Government_Seal_of_Bangladesh.png"  width="100" />
					<span class="login100-form-title-1">
                   সংস্কৃতি বিষয়ক মন্ত্রণালয়
					</span>
                    <p style="text-align: center; color: #e60073e; font-size: 24px; text-align: center">ডিজিটাল স্টোর ব্যবস্থাপনা</p>
            </div>
           <?php
$attributes = array("class" => "login100-form validate-form");
echo form_open("auth/login", $attributes);
?>
            <span class="error"> <?php echo $message; ?> </span>
            <div class="wrap-input100 validate-input m-b-26" data-validate="email is required">
                <span class="label-input100">ইউসার আইডি</span>
                <input class="input100" type="text" id="identity" name="identity" placeholder="ইমেইল/ইউসার আইডি দিন"
                       value="<?php echo set_value('identity'); ?>">
                <span class="focus-input100"></span>
            </div>
            <div class="wrap-input100 validate-input m-b-18" data-validate="Password is required">
                <span class="label-input100">পাসওয়ার্ড</span>
                <input class="input100" type="password" name="password" placeholder="পাসওয়ার্ড দিন">
                <span class="focus-input100"></span>
            </div>
            <div class="container-login100-form-btn">
                <input type="submit" name="submit" class="button login100-form-btn" value="সাইন ইন করুন">
            </div>
           <?php echo form_close(); ?>
        </div>

    </div>

</div>

<style>
    .error {
        color: #fb5f5c;
        font-size: 11px;
        font-family: verdana;

    }

</style>
