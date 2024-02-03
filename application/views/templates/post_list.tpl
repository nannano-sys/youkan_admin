<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>一覧ページだよ</title>
    <link href="/application/css/reset.css" rel="stylesheet" />
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
        <div class="nav-bar">
            <p><a href="/">管理画面だよ</a></p>
            <p>ようこそ○○さん！</p>
            <p>ログアウト</p>
        </div>
    </header>
    <div><a href="/post/edit_post">投稿する</a></div>
    <div class="list-wrapper">
    {if $post}
        {foreach $post as $val}
            <table>
                <thead>
                    <th>ID</th>
                    <th>タイトル</th>
                    <th>スラグ</th>
                    <th>本文</th>
                    <th>投稿日</th>
                    <th>ステータス</th>
                </thead>
                <tbody>
                    <tr class="tr-id">
                        <td>{$val.id}</td>
                        <td>{$val.post_title}</td>
                        <td>{$val.post_name}</td>
                        <td>{$val.post_content}</td>
                        <td>{$val.create_date}</td>
                        <td>{$val.status_txt}
                        {if $val.draft_source_article}
                            <p>{$val.draft_source_article}からの下書きです</p>
                        {/if}
                        </td>
                        <td><a href="/post/edit_post?id={$val.id}">編集</a></td>
                    </tr>
                </tbody>
            </table>
        {/foreach}
    {else}
        <div>{$not_post}</div>
    {/if}
    </div>


</body>