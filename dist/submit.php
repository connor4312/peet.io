<?php

function send() {
	foreach (array('content', 'name', 'email') as $i) {
		if (!array_key_exists($i, $_POST) || empty($_POST[$i])) {
			return false;
		}

		$_POST[$i] = str_replace(array( "\r", "\n", "%0a", "%0d"), ' ', $_POST[$i]);
	}

	return mail('connor@peet.io', 'Website Contact', "
		Name: $_POST[name]
		Email: $_POST[email]
		Content: $_POST[content]
	");
}

echo send() ? 1 : 0;