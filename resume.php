<?php
require_once("config.php");

$len = count($_POST);
//info
$name		= $_POST['ChineseName'];
$eng_name	= $_POST['EnglishName'];
$email		= $_POST['Email'];
$sign		= $_POST['Signature'];
$phone		= $_POST['Phone'];
$addr		= $_POST['Address'];

//story
$years = array();
$story = array();
$flag = "left";
for($count = 1; $count <= $len; $count++){
	if(array_key_exists("Year_" . $count, $_POST)){
		$year_key		= "Year_" . $count;
		$month_key		= "Month_" . $count;
		$location_key	= "Location_" . $count;
		$title_key		= "Title_" . $count;
		$desc_key		= "Desc_" . $count;
		$tag_key		= "Tag_" . $count;

		$year		= $_POST[$year_key];
		$month		= $_POST[$month_key];
		$location	= $_POST[$location_key];
		$title		= $_POST[$title_key];
		$desc		= $_POST[$desc_key];
		$tag		= array();

		for($tag_c = 1; $tag_c <= $len; $tag_c++){
			if(array_key_exists($tag_key . "_" . $tag_c, $_POST)){
				$_tag_key = $tag_key . "_" . $tag_c;
				$tag[] = $_POST[$_tag_key];
			}
		}

		if(!in_array($year, $years)){
			$story[] = array("type" => "year", "year" => $year);
			$years[] = $year;
		}

		$s = array(
			"type"		=> $flag,
			"year"		=> $year, 
			"month"		=> $month, 
			"location"	=> $location, 
			"title"		=> $title,
			"desc"		=> $desc,
			"tags"		=> $tag,
		);
		$story[] = $s;
		if($flag == "left"){
			$flag = "right";
		}
		else {
			$flag = "left";
		}
	}
}

//skill
$skill = array();
for($count = 1; $count <= $len; $count++){
	if(array_key_exists("Skill_" . $count, $_POST)){
		$skill_key			= "Skill_" . $count;
		$skill_score_key	= "SkillScore_" . $count;
		$skill[] = array(
			"skill" => $_POST[$skill_key],
			"score" => $_POST[$skill_score_key],
		);
	}
}

//interest
$interest = array();
for($count = 1; $count <= $len; $count++){
	if(array_key_exists("Interest_" . $count, $_POST)){
		$interest_key = "Interest_" . $count;
		$interest[] = $_POST[$interest_key];
	}
}

//personality
$personality = array();
for($count = 1; $count <= $len; $count++){
	if(array_key_exists("Personality_" . $count, $_POST)){
		$personality_key = "Personality_" . $count;
		$personality[] = $_POST[$personality_key];
	}
}

//summary
$summary = $_POST["Summary"];

//links
$link = array();
for($count = 1; $count <= $len; $count++){
	if(array_key_exists("Link_" . $count, $_POST)){
		$link_key = "Link_" . $count;
		$link[] = $_POST[$link_key];
	}
}

require '/Users/hanshinan/Dev/smarty/smarty-3_1_27/libs/Smarty.class.php';
#require 'smarty-3_1_27/libs/Smarty.class.php';

$smarty = new Smarty;

//$smarty->debugging = true;
$smarty->caching = false;
$smarty->cache_lifetime = 120;

$smarty->assign("Name", $name);
$smarty->assign("EngName", $eng_name);
$smarty->assign("Sign", $sign);
$smarty->assign("Email", $email);
$smarty->assign("Phone", $phone);
$smarty->assign("Addr", $addr);
$smarty->assign("Story", $story);
$smarty->assign("Skill", $skill);
$smarty->assign("Interest", $interest);
$smarty->assign("Personality", $personality);
$smarty->assign("Summary", $summary);
$smarty->assign("Link", $link);

if(!empty($name)){
	$content = array(
		'name' => $name,
		'eng_ame' => $eng_name,
		'sign' => $sign,
		'email' => $email,
		'phone' => $phone,
		'addr' => $addr,
		'story' => $story,
		'skill' => $skill,
		'interest' => $interest,
		'personality' => $personality,
		'summary' => $summary,
		'link' => $link,
	);
	$content = json_encode($content);
	$content = addslashes($content);
	
	$mysqli = mysqli_init();
	if($mysqli->real_connect($db_info['host'], $db_info['user'], 
			$db_info['password'], $db_info['db']))
	{
		if($mysqli->set_charset("utf8")){
			$time = time();
			$sql = "INSERT INTO user values('', \"$name\", \"$content\", $time)";
			$res = mysqli_query($mysqli, $sql);
		}
	}
}

$smarty->display('resume.tpl');
