<?php
class Post {
    private int $id;
    private string $filename;
    private string $timestamp;

    function __construct(int $i, string $f, string $t)  {
        $this->id = $i;
        $this->filename = $f;
        $this->timestamp = $t;
    }

    static function getLast() : Post {
        global $db;
        $query = $db->prepare("SELECT * FROM post ORDER BY timestamp DESC LIMIT 1");
        $query->execute();
        $result = $query->get_result();
        $row = $result->fetch_assoc();
        $p = new Post($row['id'], $row['filename'], $row['timestamp']);
        return $p; 
    }

    static function getPage(int $pageNumber = 1, int $postsPerPage = 10){
        global $db;
        $query = $db->prepare("SELECT * FROM post ORDER BY timestamp DESC LIMIT ? OFFSET ?");
        $offset = ($pageNumber-1)*$postsPerPage;
        $query->bind_param('ii', $postsPerPage, $offset);
        $query->execute();
        $result = $query->get_result();
        $postsArray = array();
        while($row = $result->fetch_assoc()){
        $post = new Post($row['id'], $row['filename'], $row['timestamp']);
        array_push($postsArray, $post);
        }
        return $postsArray;

    }






    static function upload(string $tempFileName) {
        
        $uploadDir = "img/";
        $imgInfo = getimagesize($tempFileName);
        if(!is_array($imgInfo)) {
            die("Błąd: Przekazany plik nie jest obrazem!");
        }
        
        $randomSeed = rand(10000,99999) . hrtime(true);
        
        $hash = hash("sha256", $randomSeed);
        
        $newFileName = $uploadDir . $hash . ".webp";
       
        if(file_exists($newFileName)) {
            die("Błąd: Podany plik już istnieje!");
        }
        $imageString = file_get_contents($tempFileName);
        $gdImage = @imagecreatefromstring($imageString);
        imagewebp($gdImage, $newFileName);

        
        
        global $db;
        $query = $db->prepare("INSERT INTO post VALUES(NULL, ?, ?)"); 
        $dbTimestamp = date("Y-m-d H:i:s");
        $query->bind_param("ss", $dbTimestamp, $newFileName);
        if(!$query->execute())
            die("Błąd zapisu do bazy danych");
    }
}

?>