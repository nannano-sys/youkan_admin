<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Login extends CI_Controller
{


	public function __construct()
	{
		parent::__construct();
		$this->load->model('post_model');
		$this->load->helper('url');
	}

    // ログイン画面
    public function index(){
        $this->view('login.tpl');
    }


    // ログイン処理
	public function user_auth()
	{

	}
}
