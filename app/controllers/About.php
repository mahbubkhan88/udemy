<?php

namespace Controller;

/**
 * about class
 */
class About extends Controller
{
	
	public function index()
	{

		$data['title'] = "About";

		$this->view('about',$data);
	}
	
}