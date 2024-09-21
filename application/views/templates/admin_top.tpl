<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>ブログ管理画面</title>
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

        /* Main content styles */
        main {
            padding: 2rem;
            text-align: center;
        }

        .post-button,
        .post-list-button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 0.5rem 1rem;
            cursor: pointer;
            margin: 1rem;
        }

        /* Add more styles as needed */
    </style>
</head>

<body>
    <header>
        <div class="user-greeting">ようこそ<span class="user-name">○○</span>さん</div>
        <button class="logout-button">ログアウト</button>
    </header>
    <main>
        <a href = "/post/edit_post" class="post-button">投稿する</a>
        <a href="/post/post_list" class="post-list-button">投稿一覧を確認する</a>
        {* <button class="post-list-button">投稿一覧を確認する</button> *}
        <!-- 他のコンテンツをここに追加 -->
    </main>
</body>

</html>