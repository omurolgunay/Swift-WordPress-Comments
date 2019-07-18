### Swift & WordPress Comments

##### WordPress tarafı için
- [WP REST API](https://wordpress.org/plugins/rest-api/ "WP REST API") eklentisini kurun
- Temanızın funtions.php dosyasına aşağıdaki kodları düzenleyip ekleyin.

```php
function kph_swift_api() {
  register_rest_route( 'kph/v1&secretKey=SIZIN_SECRET_KEYINIZ&appID=APP_ID', '/comments', array(
    'methods' => WP_REST_Server::READABLE,
    'callback' => 'kph_get_comments',
    'args' => array(
        'id' => array(
            'validate_callback' => function($param, $request, $key) {
                return is_numeric( $param );
            }
        ),
    ),
  ) );
}

add_action( 'rest_api_init', 'kph_swift_api' );
```
```php
function kph_get_comments( WP_REST_Request $request) {
    global $wpdb;
    $quiz_id = $request->get_param( 'id' );

    $query = "SELECT comment_ID, comment_content, comment_date, comment_author,comment_author_url FROM wp_comments WHERE comment_post_ID = '223' AND comment_approved = '1' AND DATE(CURRENT_DATE() + INTERVAL 4 DAY) ";
    $list = $wpdb->get_results($query);

    return $list;
}
```
- wp_comments tablosunun prefixi sizin farklı olabilir.
