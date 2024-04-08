<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Post extends CI_Controller
{


	public function __construct()
	{
		parent::__construct();
		$this->load->model('post_model');
		$this->load->helper('url');
	}

	//  投稿画面
	public function edit_post()
	{
		$post = $this->input->get();
		$edit_status = "";
		if (empty($post) == false) {
			$post = $this->post_model->get_post($post['id']);
			$edit_status = "edit_existing_post";
		} else {
			$post[0] = false;
			$edit_status = "edit_new_post";
		}
		// アサイン 
		$this->smarty->assign("post", $post[0]);
		$this->smarty->assign("edit_status", $edit_status);
		$this->view('edit_post.tpl');
	}

	// // プレビュー画面
	// public function post_preview(){
	// 	$post_text = $_POST['post'];
	// 	$text_with_br = nl2br($post_text);
	// 	echo $text_with_br;
	// 	exit;
	// }

	// 投稿一覧画面
	public function post_list()
	{
		$post = $this->post_model->get_post_list();
		if ($post) {
			// 文字数が多い場合、切り取りして短縮
			foreach ($post as &$val) {
				if (mb_strlen($val['post_content']) >= 60) {
					$val['post_content'] = mb_substr($val['post_content'], 0, 60) . '....';
				}

				if ($val['status'] == 1) {
					$val['status_txt'] = "下書き";
				} else if ($val['status'] == 2) {
					$val['status_txt'] = "公開中";
				}
			}

			// 取得した文字列をエスケープ
			$post = array_map(function ($element) {
				return array_map(function ($item) {
					return htmlspecialchars($item, ENT_QUOTES, 'UTF-8');
				}, $element);
			}, $post);
		} else {
			$not_post = "投稿はまだありません。";
			$this->smarty->assign("not_post", $not_post);
		}


		$this->smarty->assign("post", $post);
		$this->view('post_list.tpl');
	}


	// 新規でポストをインサート(公開)
	public function ins_post_publish()
	{
		$post = $this->input->post();
		$res = $this->post_model->insert_post($post['post_content'], $post['post_title'], $post['post_name']);
		if ($res) {
			redirect('http://' . $_SERVER['HTTP_HOST'] . '/post/post_list', 'location', 301);
		} else {
			echo '失敗したぞ';
		}
		exit;
	}

	// 既存のポストを編集する
	public function update_post_publish()
	{
		$post = $this->input->post();
		$is_draft_source = $this->post_model->get_draft_source_article_post($post['draft_source_article_id']);
		if ($is_draft_source) {
			$res = $this->post_model->insert_or_update_post_draft_post($post);
			if ($res) {
				$this->post_model->unpublish_post($post['draft_source_article_id']);
				$this->post_model->publish_post($post['post_id']);
				$this->post_model->update_status(2, $post['post_id']);
			} else {
				echo "失敗したぞ";
			}
			redirect('http://' . $_SERVER['HTTP_HOST'] . '/post/post_list', 'location', 301);
		} else {
			// トランザクション成功したらリダイレクト
			$res = $this->post_model->insert_or_update_post_draft_post($post);
			redirect('http://' . $_SERVER['HTTP_HOST'] . '/post/post_list', 'location', 301);
		}
		exit;
	}

	// 下書きのポストをインサートもしくはアップデート
	public function ins_post_draft()
	{
		$post = $this->input->post();
		// $post['post_content'] = nl2br($post['post_content']);
		$res = $this->post_model->insert_or_update_post_draft_post($post);
		if ($res) {
			// トランザクション成功したらリダイレクト
			redirect('http://' . $_SERVER['HTTP_HOST'] . '/post/post_list', 'location', 301);
		} else {
			echo '失敗したぞ';
		}
		exit;
	}
}
