<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>投稿一覧</title>
    <style>
        /* Reset default styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Header styles */
        header {
            background-color: #333;
            color: #fff;
            padding: 1rem;
            text-align: center;
        }

        .user-greeting {
            font-size: 1.2rem;
        }

        .user-name {
            font-weight: bold;
        }

        .logout-button {
            background-color: #ff5555;
            color: #fff;
            border: none;
            padding: 0.5rem 1rem;
            cursor: pointer;
            margin-top: 1rem;
        }

        /* Table styles */
        .post-list {
            width: 100%;
            border-collapse: collapse;
            margin-top: 2rem;
        }

        .post-list th,
        .post-list td {
            border: 1px solid #ddd;
            padding: 0.5rem;
            text-align: left;
        }

        .post-list th {
            background-color: #f5f5f5;
        }

        /* Add more styles as needed */
    </style>
</head>
<header>
    <div class="user-greeting">ようこそ<span class="user-name">○○</span>さん</div>
    <button class="logout-button">ログアウト</button>
</header>

<body>
<h2>投稿一覧</h2>
    <table class="post-list">
        <thead>
            <tr>
                <th>ID</th>
                <th>タイトル</th>
                <th>パーマリンク</th>
                <th>本文</th>
                <th>投稿日</th>
                <th>ステータス</th>
            </tr>
        </thead>
        {foreach $posts as $post}
        <tbody>
            <!-- 投稿一覧のレコードをここに追加 -->
            <tr>
                <td>{$post.id}</td>
                <td><a href="/post/edit_post?id={$post.id}">{$post.post_title}</a></td>
                <td>{$post.permalink}</td>
                <td>{$post.post_content}</td>
                <td>{$post.create_date}</td>
                <td>{$post.status_txt}
                {if is_null($post.draft_source_article) == false}
                    <p style="color: red;">※公開中の記事 ID{$post.draft_source_article} からの下書きです</p>
                {/if}
                </td>
            </tr>
            <!-- 他のレコードをここに追加 -->
        </tbody>
        {/foreach}
    </table>
</body>

</html>