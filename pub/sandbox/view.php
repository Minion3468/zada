<?php 
$db = new mysqli('localhost', 'root', '', 'cms_ss');
$id=1;
$q = ("SELECT filename FROM `post` WHERE 1 ORDER BY ID DESC;");
$targetDir = "pub/sandbox/img/";

$result = $db->query($q);
$resultSet = array();
while($cRecord = $result->fetch_assoc()) {
    $resultSet[] = $cRecord;
}

$arrayId = 0;
$ilosc = count($resultSet);
while ($ilosc > $arrayId) {
$filename = $resultSet[$arrayId]["filename"];
echo("<img src=\"img\\$filename\" alt=\"\"> <br>"); 
$arrayId = $arrayId + 1;  
}



?>
