<?php

echo '<div style="text-align:center">';

$mysqli = new mysqli(
    getenv('MYSQL_HOST'),
    getenv('MYSQL_USER'),
    getenv('MYSQL_PASSWORD'),
    getenv('MYSQL_DATABASE')
);

if ($mysqli->connect_errno) {
    echo "🚨 Failed to make a MySQL connection: Error ",
        $mysqli->connect_errno, ' - ',
        $mysqli->connect_error;
} else {
    echo "🎉 MySQL connected successfully.";
}
echo '</div><br/><br/>';

phpinfo();