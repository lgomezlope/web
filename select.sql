<?php
$host = 'localhost';
$db   = 'nombre_de_tu_base_de_datos';
$user = 'nombre_de_usuario';
$pass = 'contraseña';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (\PDOException $e) {
    throw new \PDOException($e->getMessage(), (int)$e->getCode());
}

// Preparar la consulta SELECT
$sql = "SELECT columna1, columna2 FROM nombre_de_tu_tabla WHERE condicion = :valor";
$stmt = $pdo->prepare($sql);

// Ejecutar la consulta con el valor que deseas filtrar
$stmt->execute(['valor' => 'dato_filtro']);

// Recuperar los resultados
while ($row = $stmt->fetch()) {
    echo $row['columna1'] . ' - ' . $row['columna2'] . "\n";
}
?>
