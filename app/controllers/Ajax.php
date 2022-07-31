<?php 
if(!defined("ROOT")) die ("direct script access denied");

/**
 * ajax class
 */
class Ajax extends Controller
{
	
	public function index()
	{

		$data['title'] = "Ajax";

		//$this->view('ajax',$data);
	}

	public function course_edit($user_id = null, $id = null)
	{

		$course   = new Course();
		$category = new Category();
		$language = new Language();
		$level    = new Level();
		$currency = new Currency();
		$price    = new Price();

		$data['categories'] = $category->findAll('asc');
		$data['languages']  = $language->findAll('asc');
		$data['levels']     = $level->findAll('asc');
		$data['currencies'] = $currency->findAll('asc');
		$data['prices']     = $price->findAll('asc');

		$data['title'] = "Ajax";
		$data['row']   = $row = $course->first(['user_id'=>$user_id, 'id'=>$id]);
		$this->view('course-edit-tabs/course-landing-page',$data);
	}
	
}