<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ブログ記事編集画面</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://admin.local.mofuri.jp/application/js/post.js"></script>
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

        .permalink-textbox {
            height: 30px;
            border: 1px solid #ccc;
            padding: 5px;
            font-size: 16px;
            border-radius: 3px;
            margin: 20px 0px;
        }

        .post_title_textbox {
            height: 30px;
            border: 1px solid #ccc;
            padding: 5px;
            font-size: 16px;
            border-radius: 3px;
            margin-bottom: 20px;
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
            <button id="midashi-button">見出し</button>
            <button id="oomidashi-button">大見出し</button>
            <button>画像挿入</button>
            <button id="preview">プレビュー</button>
        </div>
        <div class = "edit-wrapper" id = "edit-wrapper">
            <form action method="post">
                <input type="text" id="post_title" class="post_title_textbox" name="post_title"
                    value="{if $edit_status}{$postData.post_title}{/if}" placeholder="タイトルを入力">
                <textarea id="textarea" class="editor-textbox" name="post_content"
                    placeholder="ここに記事を書いてください">{if $edit_status}{$postData.post_content}{/if}</textarea>
                <input type="text" id="permalink" class="permalink-textbox" name="permalink"
                    value="{if $edit_status}{$postData.permalink}{/if}" placeholder="パーマリンクを入力">
                <input type="text" name="post_id" placeholder="post_id" value="{if $edit_status}{$postData.id}{/if}" hidden>
                <input type="text" name="draft_source_article" placeholder="draft_source_article"
                    value="{$postData.draft_source_article}" hidden>
                <div class="editor-buttons-bottom">
                    <button formaction="{$document_root_admin_url}post/ins_post_publish">新規投稿</button>
                    <button formaction="{$document_root_admin_url}post/ins_post_draft">下書き</button>
                    <button formaction="{$document_root_admin_url}post/update_post_draft">上書きして公開</button>
                    <button formaction="{$document_root_admin_url}post/delete_post">削除</button>
                    </button>
                </div>
            </form>
        </div>
        <div class = "preview-wrapper" class = "preview-wrapper">
            <div id = "post-text">
            </div>
        </div>
    </div>
</body>

</html>