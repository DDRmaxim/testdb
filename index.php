<?
    include $_SERVER["DOCUMENT_ROOT"] . "/php/config.php";
    include $_SERVER["DOCUMENT_ROOT"] . "/php/functions.php";

    use nadar\quill\Lexer;

    require __DIR__ . '/vendor/autoload.php';

    db_connect();

    $sql = "SELECT 
                ID_NL_PROP_RESALE, 
                NL_VIEW_SHORT, 
                NL_HOUSES_SHORT, 
                NL_MATERIAL_SHORT, 
                NL_PROP_RESALE_FLOOR, 
                NL_PROP_RESALE_AREA_FULL, 
                NL_PROP_RESALE_PHOTO_URLS, 
                NL_PROP_RESALE_COST_TOTAL, 
                NL_PROP_RESALE_ADDRESS, 
                NL_PROP_RESALE_DESCRIPTION, 
                NL_USER_FULL, 
                NL_PROP_RESALE_PHONE
            FROM NL_PROP_RESALE AS PR
            LEFT JOIN NL_VIEW V ON V.ID_NL_VIEW = PR.ID_NL_VIEW
            LEFT JOIN NL_HOUSES H ON H.ID_NL_HOUSES = PR.ID_NL_HOUSES
            LEFT JOIN NL_MATERIAL M ON M.ID_NL_MATERIAL = PR.ID_NL_MATERIAL
            LEFT JOIN NL_USER U ON U.ID_NL_USER = PR.ID_NL_USER";

    $result = db_query($sql);

    $table = "";
    while ($row = db_fetch_assoc($result)) {
        $img = "";
        $array_img = json_decode($row['NL_PROP_RESALE_PHOTO_URLS'], TRUE);
        foreach ($array_img as $value) {
            $img .= "<img src=\"{$value}\" width=\"250\">";
        }

        $json = json_decode(urldecode($row['NL_PROP_RESALE_DESCRIPTION']), true);

        $lex = new Lexer($json);
        $html = $lex->render();

        $table .= "<tr>
                    <td>{$row['ID_NL_PROP_RESALE']}</td>
                    <td>{$row['NL_PROP_RESALE_AREA_FULL']}</td>
                    <td>{$row['NL_PROP_RESALE_ADDRESS']}</td>
                    <td>{$row['NL_PROP_RESALE_FLOOR']}</td>
                    <td>{$row['NL_PROP_RESALE_COST_TOTAL']}</td>
                    <td>{$row['NL_VIEW_SHORT']}</td>
                    <td>{$row['NL_HOUSES_SHORT']}</td>
                    <td>{$row['NL_MATERIAL_SHORT']}</td>
                    <td>{$html}</td>
                    <td>{$row['NL_USER_FULL']}</td>
                    <td>{$row['NL_PROP_RESALE_PHONE']}</td>
                    <td>{$img}</td>
                </tr>";
    }

    db_disconnect();
?>
<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>TestDB</title>
    <meta name="viewport" content="width=device-width">
</head>
<body class="testdb">
    <h1>Вторичка</h1>
    <table border="1">
        <tr>
            <th>И/н</th>
            <th>Площадь</th>
            <th>Адрес</th>
            <th>Этаж</th>
            <th>Общая стоимость</th>
            <th>Вид из окна</th>
            <th>Тип дома</th>
            <th>Материал дома</th>
            <th>Описание</th>
            <th>Ответственный</th>
            <th>Телефон</th>
            <th>Фотографии</th>
        </tr>
        <?=$table?>
    </table>
</body>
</html>
