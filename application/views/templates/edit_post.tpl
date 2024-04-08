<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ブログ記事編集画面</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://admin.local.youkan.jp/application/js/post.js"></script>
    <style>
        /* スタイルの設定 */
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

        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }

        .editor-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .editor-buttons {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .editor-buttons-bottom {
            display: flex;
            margin-bottom: 20px;
        }

        .editor-buttons button,
        .editor-buttons-bottom button {
            padding: 10px 20px;
            font-size: 14px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .editor-buttons-bottom button {
            margin-right: 20px;
        }

        .editor-textbox {
            width: 100%;
            height: 300px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
    </style>
</head>

<header>
    <div class="user-greeting">ようこそ<span class="user-name">○○</span>さん</div>
    <button class="logout-button">ログアウト</button>
</header>

<body>
    <div class="editor-container">
        <div class="editor-buttons">
            <button id ="midashi-button">見出し</button>
            <button>大見出し</button>
            <button>画像挿入</button>
            <button>プレビュー</button>
        </div>
        <textarea id = "textarea" class="editor-textbox" placeholder="ここに記事を書いてください"></textarea>
        <div class="editor-buttons-bottom">
            <button>投稿</button>
            <button>下書き</button>
        </div>
    </div>
</body>

</html>