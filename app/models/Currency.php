<?php

namespace Model;

/**
* currencies model
*/
class Currency extends Model
{

	public $errors = [];
	protected $table = "currencies";

	protected $allowedColumns = [

		'currency',
		'symbol',
		'disabled',

	];

	public function validate($data)
	{
		$this->errors = [];

		if(empty($data['currency']))
		{
			$this->errors['currency'] = "A currency is required";
		}

		if(empty($data['symbol']))
		{
			$this->errors['symbol'] = "A short form is required";
		}			

		if(empty($this->errors))
		{
			return true;
		}

		return false;
	}

}