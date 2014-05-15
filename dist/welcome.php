<?php

function send() {
    foreach (array('content', 'name', 'email') as $i) {
        if (!array_key_exists($i, $_POST) || empty($_POST[$i])) {
            return false;
        }

        $_POST[$i] = str_replace(array( "\r", "\n", "%0a", "%0d"), ' ', $_POST[$i]);
    }

    return mail('connor@peet.io', 'Website Infringement', json_encode($_SERVER));
}
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>"Welcome"</title>
    <link rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="//use.typekit.net/ovo0mjh.js"></script>
    <script type="text/javascript">try{Typekit.load();}catch(e){}</script>
</head>
<body>
    <div class="container" id="welcome">
        <h1>Hello There</h1>
        <p>It appears you are trying to copy my website! I appreciate the fact that you enjoy my work, however I do not tolerate, at all, plagarism of any of my work and will (and have in the past) use legal means, including suit, to protect it.</p>
        <p>Your IP, address of the website you attempted to copy, and other information have been logged and sent to me. I highly suggest that you remove the infringing work in a timely manner.</p>
        <p>Below I've begun a collection of screenshots of websites one week after I was made aware of them infringing on my work. These are all the sites, not just a picked few, I've seen which have infringed on my work. Please, save us both some trouble, and don't be next!</p>

        <img src="img/welcome/a1.jpg">
        <img src="img/welcome/a2.jpg">
        <img src="img/welcome/a3.jpg">
        <img src="img/welcome/a4.jpg">
        <img src="img/welcome/a5.jpg">
        <img src="img/welcome/a6.jpg">
    </div>
</body>
</html>