<?php

namespace Model;

/**
 * course model
 */
class Course extends Model
{
	
	public $errors = [];
	protected $table = "courses";

	protected $afterSelect = [

		'get_user',
		'get_category',
		'get_sub_category',
		'get_level',
		'get_language',
		'get_price',

	];


	protected $beforeInsert = [];

	protected $allowedColumns = [
		
		'title',
		'subtitle',
		'description',
		'user_id',
		'category_id',
		'sub_category_id',
		'level_id',
		'language_id',
		'price_id',
		'currency_id',
		'promo_link',
		'csrf_code',
		'views',
		'trending',
		'welcome_message',
		'congratulations_message',
		'primary_subject',
		'course_promo_video',
		'course_image',
		'course_image_tmp',
		'tags',
		'approved',
		'published',
		'date',

	];

	public function validate($data)
	{
		$this->errors = [];

		if(empty($data['title']))
		{
			$this->errors['title'] = "A title is required";
		}else
		if(!preg_match("/^[a-zA-Z \-\_\&]+$/", trim($data['title'])))
		{
			$this->errors['title'] = "Title can only have letters, spaces and [-_&]";
		}

		if(empty($data['primary_subject']))
		{
			$this->errors['primary_subject'] = "A primary subject is required";
		}else
		if(!preg_match("/^[a-zA-Z \-\_\&]+$/", trim($data['primary_subject'])))
		{
			$this->errors['primary_subject'] = "Primary subject can only have letters, spaces and [-_&]";
		}
		

		if(empty($data['category_id']))
		{
			$this->errors['category_id'] = "A Category is required";
		}	
		
		if(empty($this->errors))
		{
			return true;
		}

		return false;
	}


	public function edit_validate($data,$id = null,$tab_name = null)
	{
		$this->errors = [];

		if($tab_name == "course-landing-page")
		{
			if(empty($data['title']))
			{
				$this->errors['title'] = "A title is required";
			}else
			if(!preg_match("/^[a-zA-Z \-\_\&]+$/", trim($data['title'])))
			{
				$this->errors['title'] = "Title can only have letters, spaces and [-_&]";
			}

			if(empty($data['subtitle']))
			{
				$this->errors['subtitle'] = "A subtitle is required";
			}else
			if(!preg_match("/^[a-zA-Z \-\_\&]+$/", trim($data['subtitle'])))
			{
				$this->errors['subtitle'] = "Subtitle can only have letters, spaces and [-_&]";
			}

			if(empty($data['primary_subject']))
			{
				$this->errors['primary_subject'] = "A primary subject is required";
			}else
			if(!preg_match("/^[a-zA-Z \-\_\&]+$/", trim($data['primary_subject'])))
			{
				$this->errors['primary_subject'] = "Primary subject can only have letters, spaces and [-_&]";
			}

			if(empty($data['description']))
			{
				$this->errors['description'] = "A description is required";
			}

			if(empty($data['language_id']))
			{
				$this->errors['language_id'] = "A language is required";
			}

			if(empty($data['level_id']))
			{
				$this->errors['level_id'] = "A level is required";
			}

			if(empty($data['category_id']))
			{
				$this->errors['category_id'] = "A category is required";
			}

			if(empty($data['currency_id']))
			{
				$this->errors['currency_id'] = "A currency is required";
			}

			if(empty($data['price_id']))
			{
				$this->errors['price_id'] = "A price is required";
			}

		} else
		if($tab_name == "course-messages")
		{
			if(empty($data['welcome_message']))
			{
				$this->errors['welcome_message'] = "A welcome message is required";
			}

			if(empty($data['congratulations_message']))
			{
				$this->errors['congratulations_message'] = "A congratulations message is required";
			}
		}

		

		if(empty($this->errors))
		{
			return true;
		}

		return false;
	}

	protected function get_user($rows)
	{

		$db = new \Database();

		if(!empty($rows['0']->user_id))
		{
			foreach ($rows as $key => $row) {
				
				$query = " select * from users where id = :id limit 1 ";
				$user = $db->query($query, ['id'=>$row->user_id]);

				if(!empty($user))
				{
					$user[0]->name = $user[0]->firstname . ' '. $user[0]->lastname;
					$rows[$key]->user_row = $user[0];
				}

			}
		}

		return $rows;
	}

	protected function get_category($rows)
	{

		$db = new \Database();
		if(!empty($rows['0']->category_id))
		{
			foreach ($rows as $key => $row) {
				
				$query = " select * from categories where id = :id limit 1 ";
				$cat = $db->query($query, ['id'=>$row->category_id]);

				if(!empty($cat))
				{
					$rows[$key]->category_row = $cat[0];
				}

			}
		}

		return $rows;	
	}

	protected function get_sub_category($rows)
	{
		return $rows;	
	}

	protected function get_level($rows)
	{
		return $rows;	
	}

	protected function get_language($rows)
	{
		return $rows;	
	}

	protected function get_price($rows){

		$db = new \Database();
		if(!empty($rows[0]->price_id))
		{
			foreach ($rows as $key => $row) {
				
				$query = "select * from prices where id = :id limit 1";
				$price = $db->query($query,['id'=>$row->price_id]);
				
				if(!empty($price))
				{
					//$price[0]->name = $price[0]->name . ' ($'. $price[0]->price .')';
					$price[0]->name = $price[0]->price .'.' .'00';
					$rows[$key]->price_row = $price[0];
				}
			}
		}

		return $rows;
	}

}