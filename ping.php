<?php
date_default_timezone_set('Asia/Tokyo');
$fp = null;
try {
    $fp = fopen('./ping.txt', 'a+');
    while(true) {
        $result = null;
        exec('ping -c 2 yahoo.co.jp', $result);
        $date = date('Y-m-d H:i:s');
        fwrite($fp, sprintf('%s %s', $date, $result[1] ?? '') . PHP_EOL);
        fwrite($fp, sprintf('%s %s', $date, $result[2] ?? '') . PHP_EOL);

        sleep(2);
    }
} catch (Exception $e) {
    echo $e->getMessage();
} finally {
    if ($fp) {
        fclose($fp);
    }
}
