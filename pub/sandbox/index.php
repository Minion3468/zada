<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="" method="post" enctype="multipart/form-data">
        <label for="uploadedFileInput">
            Wybierz plik do wgrania na serwer:
        </label>
        <input type="file" name="uploadedFile" id="uploadedFileInput">
        <input type="submit" value="Wyślij plik" name="submit" required><br>
    </form>

    <?php
    if(isset($_POST['submit']))
    {
         
        $targetDir = "img/";
        
        $sourceFileName = $_FILES['uploadedFile']['name'];

        $tempURL = $_FILES['uploadedFile']['tmp_name'];
        
        $imgInfo = getimagesize($tempURL);
        if(!is_array($imgInfo)) {
            die("Błąd: Przekazany plik nie jest obrazem!");
        }


        $hash = hash("sha256", $sourceFileName . hrtime(true));
        $newFileName = $hash        . ".webp";
    
        $imageString = file_get_contents($tempURL);
        $gdImage = @imagecreatefromstring($imageString);
        $targetURL = $targetDir . $newFileName;
   
        if(file_exists($targetURL)) {
            die("Błąd: Podany plik już istnieje!");
        }
    
        imagewebp($gdImage, $targetURL);

        $db = new mysqli('localhost', 'root', '', 'bazacms');
        $query = $db->prepare("INSERT INTO post VALUES(NULL, ?, ?)");
        $dbTimestamp = date("Y-m-d H:i:s");
        $query->bind_param("ss", $dbTimestamp, $hash);
        if(!$query->execute())
            die("Błąd zapisu do bazy danych");

        echo "Plik został poprawnie wrzucony na serwer";
    }


    ?>
    
</body>
</html>