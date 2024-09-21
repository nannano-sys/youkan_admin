<?php
defined('BASEPATH') or exit('No direct script access allowed');

class UserManagement_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    // 投稿保存
    // statusが2のやつが投稿
    public function insert_user($getPost)
    {
        var_dump($getPost);
        

        $this->db->trans_start();

        $this->db->set('name', $getPost['uname'])
            ->set('password', $getPost['psw'])
            ->insert('admin_user');

        $this->db->trans_complete();
        if ($this->db->trans_status() === false) {
            return false;
        }
        return true;
    }
}
