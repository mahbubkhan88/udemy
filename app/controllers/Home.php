<?php

namespace Controller;

if(!defined("ROOT")) die ("direct script access denied");

/**
 * home class
 */

class Home extends Controller
{
	
	public function index()
	{

		$course = new \Model\Course();
		$data['title'] = "Home";

		//Read all courses 
		$data['rows'] = $course->where(['approved'=>0],'desc',7);

		//Trending all courses order by value
		$query = "select * from courses where approved = 0 order by trending desc limit 7";
		$data['trending'] = $course->query($query);
		
		if($data['rows']){
			
			$data['first_row'] = $data['rows'][0];
			unset($data['rows'][0]);
			
			$total_rows = count($data['rows']);
			$half_rows = round($total_rows / 2);

			$data['rows1'] = array_splice($data['rows'], 0,$half_rows);
			$data['rows2'] = $data['rows'];

		}

		$this->view('home',$data);
	}
	
}