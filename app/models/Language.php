<?php 

/**
* languages model
*/
class Language extends Model
{

	public $errors = [];
	protected $table = "languages";

	protected $allowedColumns = [

		'language',
		'symbol',
		'disabled',

	];

	public function validate($data)
	{
		$this->errors = [];

		if(empty($data['language']))
		{
			$this->errors['language'] = "A language is required";
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