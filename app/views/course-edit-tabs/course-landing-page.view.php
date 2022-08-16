<div class="col-lg-9 mx-auto">

  <?php csrf() ?>

  <div class="card">
    <div class="card-body">
      <h5 class="card-title">Course Landing Page</h5>

      <form>
        <div class="row mb-5">
          <div class="col-sm-10">

            <div class="input-group mb-3">
              <span class="input-group-text" id="course-title"><b>Course Title</b></span>
              <input type="text" class="form-control" name="title" value="<?=$row->title?>">
              <small class="error error-title w-100 text-danger"></small>
            </div>

            <div class="input-group mb-3">
              <span class="input-group-text" id="course-subtitle"><b>Course Subtitle</b></span>
              <input type="text" class="form-control" name="subtitle" value="<?=$row->subtitle?>">
              <small class="error error-subtitle w-100 text-danger"></small>
            </div>

            <div class="row mb-3">
              <label for="description" class="col-sm-2 col-form-label"><b>Description</b></label>
              <div class="col-sm-10">
                <textarea class="form-control" style="height: 100px" name="description"><?=$row->description?></textarea>
              </div>
              <small class="error error-description w-100 text-danger"></small>
            </div>

            <div class="row mb-3">
              <div class="col-sm-6">
                <label><b>Language</b></label>
                <select name="language_id" class="form-select">
                  <option value="">Select Language</option>
                  <?php if(!empty($languages)):?>
                      <?php foreach($languages as $lan):?>
                        
                        <?php 
                          $row->language_id = !$row->language_id ? 1 : $row->language_id; 
                        ?>

                        <option <?=set_select('language_id',$lan->id,$row->language_id)?> value="<?=$lan->id?>"><?=esc($lan->language)?></option>
                      <?php endforeach;?>
                    <?php endif;?>
                </select>
                <small class="error error-language_id w-100 text-danger"></small>
              </div>

              <div class="col-sm-6">
                <label><b>Level</b></label>
                <select name="level_id" class="form-select" aria-label="Default select example">
                  <option selected="">Selece Level</option>
                  <?php if(!empty($levels)):?>
                    <?php foreach($levels as $level):?>
                      <option <?=set_select('level_id',$level->id, $row->level_id)?> value="<?=$level->id?>"><?=esc($level->level)?></option>
                    <?php endforeach;?>
                  <?php endif;?>
                </select>
                <small class="error error-level_id w-100 text-danger"></small>
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-sm-6">
                <label><b>Category</b></label>
                <select name="category_id" class="form-select">
                  <option value="">Select Category</option>
                  <?php if(!empty($categories)):?>
                      <?php foreach($categories as $cat):?>
                        <option <?=set_select('category_id',$cat->id,$row->category_id)?> value="<?=$cat->id?>"><?=esc($cat->category)?></option>
                      <?php endforeach;?>
                    <?php endif;?>
                </select>
                <small class="error error-category_id w-100 text-danger"></small>
              </div>

              <div class="col-sm-6">
                <label><b>Subcategory</b></label>
                <select name="sub_category_id" class="form-select" aria-label="Default select example">
                  <option selected="">Selece Subcategory</option>
                  <option value="1">Java</option>
                  <option value="2">Photoshop</option>
                  <option value="3">Blender</option>
                </select>
                <small class="error error-description w-100 text-danger"></small>
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-sm-6">
                <label><b>Currency</b></label>
                <select name="currency_id" class="form-select" aria-label="Default select example">
                  <option selected="">Selece Currency</option>
                  <?php if(!empty($currencies)):?>
                    <?php foreach($currencies as $currency):?>
                      <option <?=set_select('currency_id',$currency->id, $row->currency_id)?> value="<?=$currency->id?>"><?=esc($currency->currency)?></option>
                    <?php endforeach;?>
                  <?php endif;?>
                </select>
                <small class="error error-currency_id w-100 text-danger"></small>
              </div>

              <div class="col-sm-6">
                <label><b>Pricing</b></label>
                <select name="price_id" class="form-select" aria-label="Default select example">
                  <option selected="">Selece Pricing</option>
                  <?php if(!empty($prices)):?>
                    <?php foreach($prices as $price):?>
                      <option <?=set_select('price_id',$price->id, $row->price_id)?> value="<?=$price->id?>"><?=esc($price->price)?></option>
                    <?php endforeach;?>
                  <?php endif;?>
                </select>
                <small class="error error-price_id w-100 text-danger"></small>
              </div>
            </div>

            <div class="input-group mb-3">
              <span class="input-group-text" id="primary-subject">Primary Subject</span>
              <input type="text" class="form-control" name="primary_subject" value="<?=$row->primary_subject?>">
              <small class="error error-primary-subject w-100 text-danger"></small>
            </div>

            <div class="my-4 row">
              <div class="col-sm-4">
                <img class="js-course-image-upload-preview" src="<?=get_image($row->course_image)?>" style="width: 100%;">
              </div>

              <div class="col-sm-8">
                <div  class="h5"><b>Course Image</b></div>
                Upload your course image here. It must meet our course image quality standards to be accepted. Important guidelines: 750x422 pixels; .jpg, .jpeg,. gif, or .png. no text on the image.

                <br><br>
                <input onchange="upload_course_image(this.files[0])" class="js-image-upload-input form-control" type="file" id="formFile" name="course_image">
                <div class="progress my-4">
                  <div class="progress-bar progress-bar-image" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">20%</div>
                </div>
                <div class="js-image-upload-info hide"></div>
                <button type="button" onclick="ajax_course_image_cancel()" class="js-image-upload-cancel-button btn btn-warning btn-sm hide">Cancel Upload</button>
              </div>
            </div>

            <div class="my-4 row">
              
              <div class="col-sm-4">
                
                <video controls class="js-course-video-upload-preview" style="width: 100%;">
                  <source src="$row->course_promo_video" type="video/mp4">
                </video>

              </div>

              <div class="col-sm-8">
                <div  class="h5"><b>Course Video</b></div>
                Students who watch a well-made promo video are 5X more likely to enroll in your course. We've seen that statistic go up to 10X for exceptionally awesome videos. Learn how to make yours awesome!

                <br><br>
                <input onchange="upload_course_video(this.files[0])" class="js-video-upload-input form-control" type="file" id="formFile" name="course_promo_video">
                <div class="progress my-4">
                  <div class="progress-bar progress-bar-video" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
                </div>
                <div class="js-video-upload-info hide"></div>
                <button type="button" onclick="ajax_course_video_cancel()" class="js-video-upload-cancel-button btn btn-warning btn-sm hide">Cancel Upload</button>
              </div>
            </div>


          </div>
        </div>

      </form>

    </div>
  </div>

</div>