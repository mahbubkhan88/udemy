<?php

namespace Model;

/**
 * categories model
 */
class Category extends Model
{
	
	public $errors = [];
	protected $table = "categories";

	protected $allowedColumns = [
		
		'category',
		'disabled',
		
	];

	public function validate($data)
	{
		$this->errors = [];

		if(empty($data['category']))
		{
			$this->errors['category'] = "A category is required";
		}else
		if(!preg_match("/^[a-zA-Z \&\']+$/", trim($data['category'])))
		{
			$this->errors['category'] = "Category can only have letters and spaces";
		}		
		
		if(empty($this->errors))
		{
			return true;
		}

		return false;
	}

}