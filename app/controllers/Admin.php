<?php 

/**
 * admin class
 */
class Admin extends Controller
{
	
	public function index()
	{

		if(!Auth::logged_in())
		{
			message('please login to view the admin section');
			redirect('login');
		}

		$data['title'] = "Dashboard";

		$this->view('admin/dashboard',$data);
	}

	public function courses($action = null, $id = null)
	{

		if(!Auth::logged_in())
		{
			message('please login to view the admin section');
			redirect('login');
		}

		$user_id  = Auth::getId();
		$course   = new Course();
		$category = new Category();
		$language = new Language();
		$level    = new Level();
		$currency = new Currency();
		$price    = new Price();
		
		$data = [];
		$data['action'] = $action;
		$data['id'] = $id;

		if($action == 'add')
		{
			

			$data['categories'] = $category->findAll('asc');

			if($_SERVER['REQUEST_METHOD'] == "POST")
			{
				if($course->validate($_POST))
				{					
					$_POST['date'] = date("Y-m-d H:i:s");
					$_POST['user_id'] = $user_id;
					$_POST['price_id'] = 1;

					$course->insert($_POST);

					$row = $course->first(['user_id'=>$user_id,'published'=>0]);
					message("Your Course was successfuly created");

					if($row){
						redirect('admin/courses/edit/'.$row->id);
					}else{
						redirect('admin/courses');
					}
				}

				$data['errors'] = $course->errors;
			}
		}
		elseif ($action == 'edit') {

			$categories = $category->findAll('asc');
			$languages  = $language->findAll('asc');
			$levels     = $level->findAll('asc');
			$currencies = $currency->findAll('asc');
			$prices     = $price->findAll('asc');

			//Get course information
			$data['row'] = $row = $course->first(['user_id'=>$user_id, 'id'=>$id]);

			if($_SERVER['REQUEST_METHOD'] == "POST" && $row)
			{
				if(!empty($_POST['data_type']) && $_POST['data_type'] == "read")
				{
					if($_POST['tab_name'] == "course-landing-page")
					{

						include views_path('course-edit-tabs/course-landing-page');

					}else
					if($_POST['tab_name'] == "course-messages")
					{

						include views_path('course-edit-tabs/course-messages');

					}

				}else
				if(!empty($_POST['data_type']) && $_POST['data_type'] == "save")
				{
					
					if($course->edit_validate($_POST, $id, $_POST['tab_name'])){
						
						//Check if a temp image exixts
						if($row->course_image_tmp != "" && file_exists($row->course_image_tmp))
						{
							//delete current course image
							if(file_exists($row->course_image))
							{
								unlink($row->course_image);
							}

							$_POST['course_image']     = $row->course_image_tmp;
							$_POST['course_image_tmp'] = "";
						}

						$course->update($id,$_POST);
						
						$info['data'] = "Course saved successfully";
						$info['data_type'] = "save";

					}else{

						$info['errors'] = $course->errors;
						$info['data'] = "Please fix the errors";
						$info['data_type'] = "save";

					}
					
					echo json_encode($info);

				}else
				if(!empty($_POST['data_type']) && $_POST['data_type'] == "upload_course_image")
				{

					$folder = "uploads/courses/";
					if(!file_exists($folder))
					{
						mkdir($folder,0777,true);
					}

					$errors =[];
					if(!empty($_FILES['image']['name']))
					{
						$destination = $folder . time() . $_FILES['image']['name'];
						move_uploaded_file($_FILES['image']['tmp_name'], $destination);

						//delete old tmp file
						if(file_exists($row->course_image_tmp))
						{
							unlink($row->course_image_tmp);
						}

						$course->update($id,['course_image_tmp'=>$destination]);
					}
				}			

				die;
			}

		} else {

		//Course view
			$data['rows'] = $course->where(['user_id'=>$user_id]);
		}

		$this->view('admin/courses',$data);
	}


	public function profile($id = null)
	{

		if(!Auth::logged_in())
		{
			message('please login to view the admin section');
			redirect('login');
		}

		$id = $id ?? Auth::getId();

		$user = new User();
		$data['row'] = $row = $user->first(['id'=>$id]);

		if($_SERVER['REQUEST_METHOD'] == "POST" && $row)
		{

			$folder = "uploads/images/";
			if(!file_exists($folder))
			{
				mkdir($folder,0777,true);
				file_put_contents($folder."index.php", "<?php //silence");
				file_put_contents("uploads/index.php", "<?php //silence");
			}

			if($user->edit_validate($_POST,$id))
			{

				$allowed = ['image/jpeg','image/png'];

				if(!empty($_FILES['image']['name'])){

					if($_FILES['image']['error'] == 0){

						if(in_array($_FILES['image']['type'], $allowed))
						{
							//everything good
							$destination = $folder.time().$_FILES['image']['name'];
							move_uploaded_file($_FILES['image']['tmp_name'], $destination);

							resize_image($destination);
							$_POST['image'] = $destination;
							if(file_exists($row->image))
							{
								unlink($row->image);
							}

						}else{
							$user->errors['image'] = "This file type is not allowed";
						}
					}else{
						$user->errors['image'] = "Could not upload image";
					}
				}

				$user->update($id,$_POST);

				//message("Profile saved successfully");
				//redirect('admin/profile/'.$id);
			}

			if(empty($user->errors)){
				$arr['message'] = "Profile saved successfully";
			}else{
				$arr['message'] = "Please correct these errors";
				$arr['errors'] = $user->errors;
			}

			echo json_encode($arr);

			die;
		}

		$data['title'] = "Profile";
		$data['errors'] = $user->errors;

		$this->view('admin/profile',$data);
	}

}