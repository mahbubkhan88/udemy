<div class="col-lg-9 mx-auto">

  <div class="card">
    <div class="card-body">
      <h5 class="card-title">Edit Course</h5>

      <form>
        <div class="row mb-5">
          <div class="col-sm-10">

            <div class="input-group mb-3">
              <span class="input-group-text" id="course-title"><b>Course Title</b></span>
              <input type="text" class="form-control" name="title" value="<?=$row->title?>">
            </div>

            <div class="input-group mb-3">
              <span class="input-group-text" id="course-subtitle"><b>Course Subtitle</b></span>
              <input type="text" class="form-control" name="subtitle" value="<?=$row->subtitle?>">
            </div>

            <div class="row mb-3">
              <label for="description" class="col-sm-2 col-form-label"><b>Description</b></label>
              <div class="col-sm-10">
                <textarea class="form-control" style="height: 100px" name="description"><?=$row->description?></textarea>
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-sm-6">
                <label><b>Language</b></label>
                <select name="language_id" class="form-select" aria-label="Default select example">
                  <option selected="">Selece Language</option>
                  <?php if(!empty($languages)):?>
                    <?php foreach($languages as $lan):?>
                      <option <?=set_select('category_id',$lan->id, $row->language_id)?> value="<?=$lan->id?>"><?=esc($lan->language)?></option>
                    <?php endforeach;?>
                  <?php endif;?>
                </select>
              </div>

              <div class="col-sm-6">
                <label><b>Level</b></label>
                <select name="level_id" class="form-select" aria-label="Default select example">
                  <option selected="">Selece Level</option>
                  <?php if(!empty($levels)):?>
                    <?php foreach($levels as $level):?>
                      <option <?=set_select('category_id',$level->id, $row->level_id)?> value="<?=$level->id?>"><?=esc($level->level)?></option>
                    <?php endforeach;?>
                  <?php endif;?>
                </select>
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-sm-6">
                <label><b>Category</b></label>
                <select name="category_id " class="form-select" aria-label="Default select example">
                  <option selected="">Selece Category</option>
                  <?php if(!empty($categories)):?>
                    <?php foreach($categories as $cat):?>
                      <option <?=set_select('category_id',$cat->id, $row->category_id)?> value="<?=$cat->id?>"><?=esc($cat->category)?></option>
                    <?php endforeach;?>
                  <?php endif;?>
                </select>
              </div>

              <div class="col-sm-6">
                <label><b>Subcategory</b></label>
                <select name="sub_category_id" class="form-select" aria-label="Default select example">
                  <option selected="">Selece Subcategory</option>
                  <option value="1">Java</option>
                  <option value="2">Photoshop</option>
                  <option value="3">Blender</option>
                </select>
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-sm-6">
                <label><b>Currency</b></label>
                <select name="currency_id" class="form-select" aria-label="Default select example">
                  <option selected="">Selece Currency</option>
                  <?php if(!empty($currencies)):?>
                    <?php foreach($currencies as $currency):?>
                      <option <?=set_select('category_id',$currency->id, $row->currency_id)?> value="<?=$currency->id?>"><?=esc($currency->currency)?></option>
                    <?php endforeach;?>
                  <?php endif;?>
                </select>
              </div>

              <div class="col-sm-6">
                <label><b>Pricing</b></label>
                <select name="price_id" class="form-select" aria-label="Default select example">
                  <option selected="">Selece Pricing</option>
                  <?php if(!empty($prices)):?>
                    <?php foreach($prices as $price):?>
                      <option <?=set_select('category_id',$price->id, $row->price_id)?> value="<?=$price->id?>"><?=esc($price->price)?></option>
                    <?php endforeach;?>
                  <?php endif;?>
                </select>
              </div>
            </div>

            <div class="input-group mb-3">
              <span class="input-group-text" id="primary-subject">Primary Subject</span>
              <input type="text" class="form-control" name="primary_subject" value="<?=$row->primary_subject?>">
            </div>

            <div class="my-4 row">
              <div class="col-sm-4">
                <img src="<?=ROOT?>/adminassets/img/no-image.jpg" style="width: 100%;">
              </div>

              <div class="col-sm-8">
                <div  class="h5"><b>Course Image</b></div>
                Upload your course image here. It must meet our course image quality standards to be accepted. Important guidelines: 750x422 pixels; .jpg, .jpeg,. gif, or .png. no text on the image.

                <br><br>
                <input class="form-control" type="file" id="formFile" name="course_image">
                <div class="progress my-4">
                  <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
                </div>
              </div>
            </div>

            <div class="my-4 row">
              <div class="col-sm-4">
                <img src="<?=ROOT?>/adminassets/img/no-image.jpg" style="width: 100%;">
              </div>
              <div class="col-sm-8">
                <div  class="h5"><b>Course Video</b></div>
                Students who watch a well-made promo video are 5X more likely to enroll in your course. We've seen that statistic go up to 10X for exceptionally awesome videos. Learn how to make yours awesome!

                <br><br>
                <input class="form-control" type="file" id="formFile" name="course_promo_video">
                <div class="progress my-4">
                  <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
                </div>

              </div>
            </div>


          </div>
        </div>

      </form>

    </div>
  </div>

</div>