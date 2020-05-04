<?php

return [
    'class' => 'yii\db\Connection',
    'dsn' => '' . getenv('DB_TYPE') . ':host=' . getenv('DB_HOST') . ';dbname=' . getenv('DB_NAME') . '',
    'username' => getenv('DB_USER_NAME'),
    'password' => getenv('DB_USER_PASSWORD'),
    'charset' => 'utf8', // For PostgreSQL
//    'charset' => 'utf8mb4', // For MySQL

//            'enableSchemaCache' => true,
//            'schemaCacheDuration' => 3600,
//            'schemaCache' => 'cache',

    'attributes' => [
        PDO::ATTR_PERSISTENT => false,
    ],
];
