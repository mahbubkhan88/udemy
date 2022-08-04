<div class="col-lg-9 mx-auto">

  <div class="card">
    <div class="card-body">
      <h5 class="card-title">Course Messages</h5>

      <form>
        <div class="row mb-5">
          <div class="col-sm-10">

            <div class="row mb-3">
              <label for="welcome-message" class="col-sm-2 col-form-label"><b>Welcome Message</b></label>
              <div class="col-sm-10">
                <textarea class="form-control" style="height: 100px" name="welcome_message"><?=$row->welcome_message?></textarea>
              </div>
              <small class="error error-welcome-message w-100 text-danger"></small>
            </div>

            <div class="row mb-3">
              <label for="congratulations-message" class="col-sm-2 col-form-label"><b>Congratulations Message</b></label>
              <div class="col-sm-10">
                <textarea class="form-control" style="height: 100px" name="congratulations_message"><?=$row->congratulations_message?></textarea>
              </div>
              <small class="error error-congratulations-message w-100 text-danger"></small>
            </div>


          </div>
        </div>

      </form>

    </div>
  </div>

</div>