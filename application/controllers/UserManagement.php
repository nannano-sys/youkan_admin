<?php
defined('BASEPATH') or exit('No direct script access allowed');

class UserManagement extends CI_Controller
{


	public function __construct()
	{
		parent::__construct();
		$this->load->model('usermanagement_model');
		$this->load->helper('url');
	}

    // ユーザー登録
    public function register_user(){
		$getPost = $this->input->post();
		if(!empty($getPost)){
			$result = $this->usermanagement_model->insert_user($getPost);
			if($result){
				redirect('login', 'location', 301);
			}
		}
        $this->view('register_user.tpl');
		
    }


    // ログイン処理
}
