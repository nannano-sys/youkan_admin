<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Post_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
    }

    // 投稿保存
    // statusが2のやつが投稿
    public function insert_post($post_content, $post_title, $post_name){
        $this->db->trans_start();

        $this->db->set('post_content', $post_content)
        ->set('post_title', $post_title)
        ->set('post_name', $post_name)
        ->set('status', 2)
        ->insert('post');

        $this->db->trans_complete();
        if($this->db->trans_status() === false){
            return false;
        }
        return true;
    }


    // 下書きインサート
    // statusが1のやつが下書き
    public function insert_or_update_post_draft_post($post){
        // echo "<pre>";
        // print_r($post);
        // echo "<\pre>";
        // ポストステータスが下書きのやつ取得
        $post_draft = $this->get_post($post['post_id'], 1);
        // ポストステータスが公開のやつ取得
        $post_publish = $this->get_post($post['post_id'], 2);
        $this->db->trans_start();
        
        if($post_draft){
            $this->db->set('post_content', $post['post_content']);
            $this->db->set('post_title', $post['post_title']);
            $this->db->set('post_name', $post['post_name']);
            $this->db->set('status', 1);
            $this->db->where('id', $post['post_id']);
            $this->db->update('post');
        } else if ($post_publish) {
            $this->db->set('post_content', $post['post_content']);
            $this->db->set('post_title', $post['post_title']);
            $this->db->set('post_name', $post['post_name']);
            $this->db->set('draft_source_article', $post['post_id']);
            $this->db->set('status', 1);
            $this->db->insert('post');
        }
        
        $this->db->trans_complete();
        if($this->db->trans_status() === false){
            return false;
        }
        return true;
    }

    // ポストを取得
    public function get_post($post_id, $status = NULL) {
        $this->db->select(
            '*'
        )
        ->from('post')
        ->where('id', $post_id);
        if(is_null($status) == false){
            $this->db->where('status', $status);
        }
        $query = $this->db->get();

        if($query->num_rows()){
            return $query->result_array();
        }
        return false;
    }

    public function get_post_list() {
        $query = $this->db->select(
            '
            id,
            status,
            post_title,
            post_name,
            post_content,
            create_date,
            draft_source_article'
        )
        ->from('post AS P')
        ->where('post_status', 1)
        ->order_by('create_date', 'DESC')
        ->get();

        if($query->num_rows()){
            return $query->result_array();
        }

        return false;
    }

    // 下書き元のポストを取得する
    public function get_draft_source_article_post($draft_source_article_id){
        $query = $this->db->select(
            'id'
        )
        ->from('post')
        ->where('post_status', 1)
        ->where('status', 2)
        ->where('id', $draft_source_article_id)
        ->get();

        if($query->num_rows()){
            return $query->result_array();
        }

        return false;
    }

    // ポストを非公開にする
    public function unpublish_post($post_id) {
        $this->db->set('post_status', 2);
        $this->db->where('id', $post_id);
        $this->db->update('post');
    }

    // ポストを公開する
    public function publish_post($post_id) {
        $this->db->set('post_status', 1);
        $this->db->where('id', $post_id);
        $this->db->update('post');
    }

    // ポストのステータスを変更する
    public function update_status($val, $post_id) {
        $this->db->set('status', $val);
        $this->db->where('id', $post_id);
        $this->db->update('post');
    }


}