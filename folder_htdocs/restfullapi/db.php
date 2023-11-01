<?php
$db = mysqli_connect('localhost', 'root', '', 'user_data');
if (!$db) {
  echo "Database connection failed";
}
