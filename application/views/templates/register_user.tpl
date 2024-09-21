<!DOCTYPE html>
<html>

<head>
    <title>管理者登録</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        .container {
            width: 300px;
            padding: 16px;
            background-color: white;
            margin: 0 auto;
            margin-top: 100px;
            border: 1px solid black;
            border-radius: 4px;
        }

        .container.cancel {
            margin-top: 20px;
        }

        input[type=text],
        input[type=password] {
            width: 90%;
            padding: 15px;
            margin: 5px 0 22px 0;
            display: block;
            border: none;
            background: #f1f1f1;
        }

        input[type=text]:focus,
        input[type=password]:focus {
            background-color: #ddd;
            outline: none;
        }

        button {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            opacity: 0.9;
        }

        button:hover {
            opacity: 1;
        }

        .cancelbtn {
            padding: 14px 20px;
            background-color: #f44336;
        }
    </style>
</head>

<body>
    <h2>管理者登録</h2>

    <form action="/register" method="post">
        <div class="container">
            <div class='name-wapper'>
                <label for="uname"><b>ユーザー名</b></label>
                <input type="text" placeholder="ユーザー名を入力" name="uname" required>
            </div>

            <div class='psw-wapper'>
                <label for="psw"><b>パスワード</b></label>
                <input type="password" placeholder="パスワードを入力" name="psw" required>
            </div>


            <div class='psw-wapper'>
                <label for="psw-repeat"><b>パスワード（確認）</b></label>
                <input type="password" placeholder="パスワードを再入力" name="psw-repeat" required>
            </div>

            <button formaction = "{$document_root_admin_url}/usermanagement/register_user">登録</button>

        </div>
    </form>
    </div>

    <div class="container cancel" style="background-color:#f1f1f1">
    <a href="{$document_root_admin_url}login">
        <button type="button" class="cancelbtn">キャンセル</button>
    </a>
    </div>
    </form>
</body>

</html>