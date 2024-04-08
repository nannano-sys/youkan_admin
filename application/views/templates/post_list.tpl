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
                <th>スラグ</th>
                <th>本文</th>
                <th>投稿日</th>
                <th>ステータス</th>
            </tr>
        </thead>
        <tbody>
            <!-- 投稿一覧のレコードをここに追加 -->
            <tr>
                <td>1</td>
                <td>記事タイトル1</td>
                <td>slug-1</td>
                <td>記事本文1...</td>
                <td>2024-04-06</td>
                <td>公開中</td>
            </tr>
            <tr>
                <td>2</td>
                <td>記事タイトル2</td>
                <td>slug-2</td>
                <td>記事本文2...</td>
                <td>2024-04-05</td>
                <td>下書き</td>
            </tr>
            <!-- 他のレコードをここに追加 -->
        </tbody>
    </table>
</body>

</html>