<?php

namespace Model;

/**
* prices model
*/
class Price extends Model
{

	public $errors = [];
	protected $table = "prices";

	protected $allowedColumns = [

		'name',
		'price',
		'disabled',

	];

	public function validate($data)
	{
		$this->errors = [];

		if(empty($data['name']))
		{
			$this->errors['name'] = "A name is required";
		}

		if(empty($data['price']))
		{
			$this->errors['price'] = "A price is required";
		}			

		if(empty($this->errors))
		{
			return true;
		}

		return false;
	}

}