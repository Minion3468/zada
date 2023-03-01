<?php
class Post {
    static function upload(string $tempFileName) {
        
        $uploadDir = "img/";
        $imgInfo = getimagesize($tempFileName);
        if(!is_array($imgInfo)) {
            die("Błąd: Przekazany plik nie jest obrazem!");
        }
        
        $randomSeed = rand(10000,99999) . hrtime(true);
        
        $hash = hash("sha256", $randomSeed);
        
        $targetFileName = $uploadDir . $hash . ".webp";
       
        if(file_exists($targetFileName)) {
            die("Błąd: Podany plik już istnieje!");
        }
        $imageString = file_get_contents($tempFileName);
        $gdImage = @imagecreatefromstring($imageString);
        imagewebp($gdImage, $targetFileName);

        
        
        global $db;
        $query = $db->prepare("INSERT INTO post VALUES(NULL, ?, ?)"); 
        $dbTimestamp = date("Y-m-d H:i:s");
        $query->bind_param("ss", $dbTimestamp, $newFileName);
        if(!$query->execute())
            die("Błąd zapisu do bazy danych");
    }
}

?>