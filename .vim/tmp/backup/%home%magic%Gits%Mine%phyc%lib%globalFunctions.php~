<?php

function does_game_exist($id) {
	return file_exists("games/".$id.".json");
}

function create_game($id) {
	$json_data = "{id:$id,users:[]}";
	file_put_contents("games/".$id.".json");
}


?>
