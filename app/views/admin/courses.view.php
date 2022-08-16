<?php $this->view('admin/admin-header',$data) ?>

<style>
  .tabs-holder{
    display: flex;
    margin-top: 10px;
    margin-bottom: 10px;
    justify-content: center;
    text-align: center;
    flex-wrap: wrap;
  }

  .my-tab{
    flex: 1;
    border-bottom: solid 2px #ccc;
    padding-top: 10px;
    padding-bottom: 10px;
    cursor: pointer;
    user-select: none;
    min-width: 200px;
  }

  .my-tab:hover{
    color: #4154f1;
  }

  .active-tab{
    color: #4154f1;
    border-bottom: solid 2px #4154f1;
  }

  .hide{
    display: none;
  }

  .loader{
    position: relative;
    width: 200px;
    height: 200px;
    left: 50%;
    top: 50%;
    transform: translateX(-50%);
    opacity: 0.3;
  }

</style>

<?php if($action == 'add'):?>

  <div class="card col-md-5 mx-auto">
    <div class="card-body">
      <h5 class="card-title">New Course</h5>

      <!-- No Labels Form -->
      <form method="post" class="row g-3">

        <div class="col-md-12">
          <input value="<?=set_value('title')?>" name="title" type="text" class="form-control <?=!empty($errors['title']) ? 'border-danger':'';?>" placeholder="Course title">

          <?php if(!empty($errors['title'])):?>
            <small class="text-danger"><?=$errors['title']?></small>
          <?php endif;?>

        </div>

        <div class="col-md-12">
          <input value="<?=set_value('primary_subject')?>" name="primary_subject" type="text" class="form-control <?=!empty($errors['primary_subject']) ? 'border-danger':'';?>" placeholder="Primary subject e.g Photography or Vlogging">

          <?php if(!empty($errors['primary_subject'])):?>
            <small class="text-danger"><?=$errors['primary_subject']?></small>
          <?php endif;?>

        </div>


        <div class="col-md-12">
          <select name="category_id" id="inputState" class="form-select <?=!empty($errors['category_id']) ? 'border-danger':'';?>">

            <option value="" selected="">Course Category...</option>
            <?php if(!empty($categories)):?>
              <?php foreach($categories as $cat):?>
                <option <?=set_select('category_id',$cat->id)?> value="<?=$cat->id?>"><?=esc($cat->category)?></option>
              <?php endforeach;?>
            <?php endif;?>

          </select>

          <?php if(!empty($errors['category_id'])):?>
            <small class="text-danger"><?=$errors['category_id']?></small>
          <?php endif;?>

        </div>

        <div class="text-center">
          <button type="submit" class="btn btn-primary">Save</button>

          <a href="<?=ROOT?>/admin/courses">
            <button type="button" class="btn btn-secondary">Cancel</button>
          </a>
        </div>
      </form><!-- End No Labels Form -->

    </div>
  </div>

<?php elseif($action == 'edit'):?>

  <div class="card">
    <div class="card-body">
      <h5 class="card-title">Edit Course</h5>

      <?php if(!empty($row)):?>

        <div class="float-end">
          <button onclick="save_content()" class="js-save-button btn btn-success disabled">Save</button>
          <a href="<?=ROOT?>/admin/courses">
            <button class="btn btn-primary">Back</button>
          </a>
        </div>
        
        <h5 class=""><?=esc($row->title)?></h5>


        <!-- Tabs -->
        <br>
        <div class="tabs-holder">
          <div onclick="set_tab(this.id,this)" id="intended-learners" class="my-tab active-tab">Intended Learners</div>
          <div onclick="set_tab(this.id,this)" id="curriculum" class="my-tab">Curriculum</div>
          <div onclick="set_tab(this.id,this)" id="course-landing-page" class="my-tab">Course Landing Page</div>
          <div onclick="set_tab(this.id,this)" id="promotions" class="my-tab">Promotions</div>
          <div onclick="set_tab(this.id,this)" id="course-messages" class="my-tab">Course Messages</div>
        </div>
        <!-- End Tabs -->

        <!-- div tabs -->
        <div oninput="something_changed(event)">
          <div id="tabs-content">

          </div>
        </div>
        <!-- end div tabs -->

      <?php else:?>
        <div>That course was not found!</div>
      <?php endif;?>

    </div>
  </div>

<?php else:?>

  <div class="card">

    <div class="card-body">
      <h5 class="card-title">
        My Courses 
        <a href="<?=ROOT?>/admin/courses/add">
          <button class="btn btn-primary float-end"><i class="bi bi-camera-video-fill"></i> New Course</button>
        </a>
      </h5>

      <!-- Table with stripped rows -->
      <table class="table table-striped">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Title</th>
            <th scope="col">image</th>
            <th scope="col">Instructor</th>
            <th scope="col">Category</th>
            <th scope="col">Price</th>
            <th scope="col">Primary Subject</th>
            <th scope="col">Date</th>
            <th scope="col">Action</th>
          </tr>
        </thead>

        <?php if(!empty($rows)):?>
          <tbody>

            <?php foreach($rows as $row):?>
              <tr>
                <th scope="row"><?=$row->id?></th>
                <td><?=esc($row->title)?></td>
                <td><img src="<?=get_image($row->course_image)?>" style="width: 120px; height: 80px; object-fit: cover;"></td>
                <td><?=esc($row->user_row->name ?? 'Unknown')?></td>
                <td><?=esc($row->category_row->category ?? 'Unknown')?></td>
                <td><?=esc($row->price_row->name ?? 'Unknown')?></td>
                <td><?=esc($row->primary_subject)?></td>
                <td><?=get_date($row->date)?></td>
                <td>
                  <a href="<?=ROOT?>/admin/courses/edit/<?=$row->id?>">
                    <i class="bi bi-pencil-square"></i> 
                  </a>
                  <a href="<?=ROOT?>/admin/courses/delete/<?=$row->id?>">
                    <i class="bi bi-trash-fill text-danger"></i>
                  </a>
                </td>
              </tr>
            <?php endforeach;?>

          </tbody>
        <?php else:?>
          <tr><td colspan="10">No records found!</td></tr>
        <?php endif;?>

      </table>
      <!-- End Table with stripped rows -->

    </div>
  </div>

<?php endif;?>

<script>

  var tab = sessionStorage.getItem("tab") ? sessionStorage.getItem("tab"): "intended-learners";
  var dirty = false;

  function show_tab(tab_name)
  {

    var contentDiv = document.querySelector("#tabs-content");
    show_loader(contentDiv);

    // change the active tab
    var div = document.querySelector("#"+tab_name);
    var children = div.parentNode.children;
    
    for (var i = 0; i < children.length; i++) {
      children[i].classList.remove("active-tab");
    }

    div.classList.add("active-tab");

    send_data({
      tab_name: tab,
      data_type: "read",
    });

    disable_save_button(false);

  }

  function send_data(obj)
  {

    var myform = new FormData();
    for(key in obj){
      myform.append(key,obj[key]); 
    }

    var ajax = new XMLHttpRequest();

    ajax.addEventListener('readystatechange',function(){

      if(ajax.readyState == 4){

        if(ajax.status == 200){
          handle_result(ajax.responseText);
        }else{
          alert("an error occurred");
        }
      }
    });

    ajax.open('post','',true);
    ajax.send(myform);

  }

//handle result
function handle_result(result)
{

    //console.log(result);
    if(result.substr(0,2) == '{"')
    {
      var obj = JSON.parse(result);
      if(typeof obj == 'object'){

        if(obj.data_type == "save"){

          alert(obj.data);

          //clear all errors
          var error_containers = document.querySelectorAll(".error");
          for (var i = 0; i < error_containers.length; i++) {
            error_containers[i].innerHTML = "";
          }

          //show any errors
          if(typeof obj.errors == 'object')
          {
            for(key in obj.errors)
            {
              document.querySelector(".error-"+key).innerHTML = obj.errors[key];
            }

          }else{
            disable_save_button(false);
            dirty = false;
          }
        }

      }

    }else{

      var contentDiv = document.querySelector("#tabs-content");
      contentDiv.innerHTML = result;
    }

  }

  function set_tab(tab_name)
  {

    if(dirty)
    {
      //ask user to save when switching tabs
      if(!confirm("Your changes were not saved. continue?!"))
      {
        return;
      }

    }

    tab = tab_name;
    sessionStorage.setItem("tab", tab_name);

    dirty = false;
    show_tab(tab_name);

  }

  function something_changed(e)
  {
    dirty = tab;
    disable_save_button(true);
  }

  // Disabled save button
  function disable_save_button(status = false)
  {
    if(status){
      document.querySelector(".js-save-button").classList.remove("disabled");
    }else{
      document.querySelector(".js-save-button").classList.add("disabled");
    }
  }

  // Loader image show
  function show_loader(item)
  {
    item.innerHTML = `<img class="loader" src="<?=ROOT?>/adminassets/img/loader.gif">`;
  }

  show_tab(tab);

  // Save content
  function save_content()
  {
    var content = document.querySelector("#tabs-content");
    var inputs = content.querySelectorAll("input,textarea,select");

    var obj = {};
    obj.data_type = "save";
    obj.tab_name = tab;

    for (var i = 0; i < inputs.length; i++) {

      var key = inputs[i].name;
      obj[key] = inputs[i].value;

    }

    send_data(obj);

  }

  // upload course image
  var course_image_uploading      = false;
  var ajax_course_image           = null;

  function upload_course_image(file)
  {

    if(course_image_uploading){

      alert("Please wait while the others image uploads");
      return;
    }

    //validate image extension
    var allowed_types = ['jpg','jpeg','png'];
    var ext = file.name.split(".").pop();
    ext = ext.toLowerCase();

    if(!allowed_types.includes(ext))
    {
      alert("Only files of this type allowed: "+allowed_types.toString(","));
      return;
    }

    // display an image upload preview
    var img = document.querySelector(".js-course-image-upload-preview");
    var link = URL.createObjectURL(file);
    img.src = link;

    //began image uploads
    course_image_uploading = true;

    document.querySelector(".js-image-upload-info").innerHTML = file.name;
    document.querySelector(".js-image-upload-info").classList.remove("hide");
    document.querySelector(".js-image-upload-input").classList.add("hide");
    document.querySelector(".js-image-upload-cancel-button").classList.remove("hide");

    var myform = new FormData();
    ajax_course_image = new XMLHttpRequest();

    ajax_course_image.addEventListener('readystatechange',function(){

      if(ajax_course_image.readyState == 4){

        if(ajax_course_image.status == 200){
          
          //everything went well
          //alert("Upload completed");
          //alert(ajax_course_image.responseText);
        }

          course_image_uploading = false;
          document.querySelector(".js-image-upload-info").classList.add("hide");
          document.querySelector(".js-image-upload-input").classList.remove("hide");
          document.querySelector(".js-image-upload-cancel-button").classList.add("hide");
      }

    });

    ajax_course_image.addEventListener('error',function(){
      alert("An error occurred");
    });

    ajax_course_image.addEventListener('abort',function(){
      alert("Upload aborted");
    });

    ajax_course_image.upload.addEventListener('progress',function(e){


      var parecnt = Math.round((e.loaded / e.total) * 100);
      document.querySelector(".progress-bar-image").style.width = parecnt + "%";
      document.querySelector(".progress-bar-image").innerHTML = parecnt + "%";

    });

    myform.append('data_type','upload_course_image');
    myform.append('tab_name',tab);
    myform.append('image',file);
    myform.append('csrf_code',document.querySelector(".js-csrf_code").value);

    ajax_course_image.open('post','',true);
    ajax_course_image.send(myform);
  }

  //image cancel button 
  function ajax_course_image_cancel()
  {
    ajax_course_image.abort();
  }



  // upload course video
  var course_video_uploading      = false;
  var ajax_course_video           = null;

  function upload_course_video(file)
  {

    if(course_video_uploading){

      alert("Please wait while the others video uploads");
      return;
    }

    //validate video extension
    var allowed_types = ['mp4'];
    var ext = file.name.split(".").pop();
    ext = ext.toLowerCase();

    if(!allowed_types.includes(ext))
    {
      alert("Only files of this type allowed: "+allowed_types.toString(","));
      return;
    }

    // display an video upload preview
    var vdo = document.querySelector(".js-course-video-upload-preview");
    var link = URL.createObjectURL(file);
    vdo.src = link;

    //began video uploads
    course_video_uploading = true;

    document.querySelector(".js-video-upload-info").innerHTML = file.name;
    document.querySelector(".js-video-upload-info").classList.remove("hide");
    document.querySelector(".js-video-upload-input").classList.add("hide");
    document.querySelector(".js-video-upload-cancel-button").classList.remove("hide");

    var myform = new FormData();
    ajax_course_video = new XMLHttpRequest();

    ajax_course_video.addEventListener('readystatechange',function(){

      if(ajax_course_video.readyState == 4){

        if(ajax_course_video.status == 200){
          
          //everything went well
          //alert("Upload completed");
          //alert(ajax_course_video.responseText);
        }

          course_video_uploading = false;
          document.querySelector(".js-video-upload-info").classList.add("hide");
          document.querySelector(".js-video-upload-input").classList.remove("hide");
          document.querySelector(".js-video-upload-cancel-button").classList.add("hide");
      }

    });

    ajax_course_video.addEventListener('error',function(){
      alert("An error occurred");
    });

    ajax_course_video.addEventListener('abort',function(){
      alert("Upload aborted");
    });

    ajax_course_video.upload.addEventListener('progress',function(e){


      var parecnt = Math.round((e.loaded / e.total) * 100);
      document.querySelector(".progress-bar-video").style.width = parecnt + "%";
      document.querySelector(".progress-bar-video").innerHTML = parecnt + "%";

    });

    myform.append('data_type','upload_course_video');
    myform.append('tab_name',tab);
    myform.append('video',file);
    myform.append('csrf_code',document.querySelector(".js-csrf_code").value);

    ajax_course_video.open('post','',true);
    ajax_course_video.send(myform);
  }

  //video cancel button 
  function ajax_course_video_cancel()
  {
    ajax_course_video.abort();
  }

</script>

<?php $this->view('admin/admin-footer',$data) ?>