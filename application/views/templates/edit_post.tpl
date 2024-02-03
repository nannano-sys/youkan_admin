<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>投稿ページだよ</title>
    <link href="/application/css/reset.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/application/css/index.css">
    <link rel="stylesheet" href="/application/css/hamburger.css">
    <link rel="stylesheet" href="/application/css/post.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="/application/js/post.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="/application/js/hamburger.js"></script>
</head>
<body>
<header>
    <div class = "nav-bar">
        <p><a href = "/">管理画面だよ</a></p>
        <p>ようこそ○○さん！</p>
        <p>ログアウト</p>
    </div>
</header>
<button id="midashi-button">見出しボタン</button>
<button id="oomidashi-button">大見出しボタン</button>
<button id = "preview">プレビュー</button>
<div class = "edit-wrapper">
<form action method = 'POST'>
<div class = "edit-post-main">
    <div class = "post-title">
        <label>ポスト名</label>
<input type = "text" name = "post_title" {if $post} value="{$post.post_title}"{/if}>
    </div>
    <div class = "post-name">
        <label>スラグ</label>
<input type = "text" name = "post_name" {if $post}value = "{$post.post_name}"{/if}>
    </div>
<textarea id = "textarea" name = "post_content" placeholder = "ブログの本文を入力してね">{if $post}{$post.post_content}{/if}</textarea>
    </div>
    {if $edit_status == "edit_new_post"}
    <button class = "submit" data-action = "/post/ins_post_publish">投稿</button>
    {else if $edit_status == "edit_existing_post"}
    <button class = "submit" data-action = "/post/update_post_publish">投稿</button>
    {/if}
    <button class = "submit" data-action = "/post/ins_post_draft" >下書き</button>

<input type = "text" name = "post_id" {if $post}value = "{$post.id}"{/if}>
<input type = "text" name = "draft_source_article_id" {if $post}value = "{$post.draft_source_article}"{/if}>
</form>
</div>
{include file='preview.tpl'}

</body>

<script>
$('.submit').on('click',function(){
    $(this).parents('form').attr('action', $(this).data('action'));
    $(this).parents('form').submit();
})
</script>

