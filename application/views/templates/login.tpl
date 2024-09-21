<!DOCTYPE html>
<html>

<head>
    <title>管理者ログイン</title>
</head>

<body>
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

        .container.register {
            margin-top: 20px;
        }

        input[type=text],
        input[type=password] {
            padding: 15px;
            margin: 5px 0 22px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }

        input[type=text]:focus,
        input[type=password]:focus {
            background-color: #ddd;
            outline: none;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
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
    <h2>管理者ログイン</h2>

    <form action="/login" method="post">
        <div class="container">
            <div class=uname_wrapper>
                <label for="uname"><b>ユーザー名</b></label>
                <input type="text" placeholder="ユーザー名を入力" name="uname" required>
            </div>

            <div class=psw_wrapper>
                <label for="psw"><b>パスワード</b></label>
                <input type="password" placeholder="パスワードを入力" name="psw" required>
            </div>

            <button type="submit">ログイン</button>
        </div>

    </form>
    <div class="container register" style="">
    <a href="{$document_root_admin_url}usermanagement/register_user">
        <button type="button" class="cancelbtn">管理者ユーザーを追加</button>
    </a>
    </div>
</body>

</html>