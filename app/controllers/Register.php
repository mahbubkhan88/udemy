<?php 

/**
 * register class
 */
class Register extends Controller
{
	
	public function index()
	{

		$data['errors'] = [];

		$user = new User();

		if($_SERVER['REQUEST_METHOD'] == "POST")
		{
			if($user->validate($_POST))
			{
				$_POST['role'] = "Admin";
				$_POST['date'] = date("Y-m-d H:i:s");
				$user->insert($_POST);

				message("Your profile was successfuly created.");
				redirect('login');
			}
		}

		$data['errors'] = $user->errors;
		$data['title'] = "Register";

		$this->view('register',$data);
	}
	
}