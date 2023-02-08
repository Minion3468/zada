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
         //zdefiniuj folder do którego trafią pliki (ścieżka względem pliku index.php)
         $targetDir = "img/";


         //pobierz pierwotną nazwę pliku z tablicy $_FILES
         $sourceFileName = $_FILES['uploadedFile']['name'];


         //wyciągnij pierwotne rozszerzenie pliku
        $sourceFileExtension = pathinfo($sourceFileName, PATHINFO_EXTENSION);
        
        
        //zmień litery rozszerzenia na małe
        $sourceFileExtension = strtolower($sourceFileExtension);

        
        //wygeneruj hash - nową nazwę pliku
        $newFileName = hash("sha256", $sourceFileName) . hrtime(true)
                            . "." . $sourceFileExtension;
        
                            
        //wygeneruj pełny docelowy URL
        $targetURL = $targetDir . $newFileName;
 

         //pobierz tymczasową ścieżkę do pliku na serwerze
         $tempURL = $_FILES['uploadedFile']['tmp_name'];

         
         //sprawdź czy mamy do czynienia z obrazem
         $imgInfo = getimagesize($tempURL);
         if(!is_array($imgInfo)) {
             die("Błąd: Przekazany plik to nie obrazem!");
         }
 

         //zbuduj docelowy URL pliku na serwerze
         //$targetURL = $targetDir . $sourceFileName;
         //wycofane na rzecz hasha
 

         //sprawdź czy plik przypadkiem już nie istnieje
         if(file_exists($targetURL)) {
             die("Błąd: Podany plik już istnieje!");
         }
 

         //przesuń plik do docelowej lokalizacji
         move_uploaded_file($tempURL, $targetURL);
         
         echo "Plik został poprawnie wrzucony na serwer";
    }


    ?>
    
</body>
</html>