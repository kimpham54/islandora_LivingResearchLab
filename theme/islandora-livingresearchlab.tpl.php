<?php
/**
 * @file
 * This is the template file for the livingresearchlab object page.
 *
 * Here we build an html page using the variables passed in by
 * the islandora_livingresearchlab_preprocess_islandora_livingresearchlab
 * function.  Elements such as labels and buttons can be added here
 */
$islandora_content = $islandora_object['DWC']->content;
//CONTENT IS THE DATASTREAM

$path = drupal_get_path('module', 'islandora_livingresearchlab');
drupal_add_css("$path/css/islandora_livingresearchlab.css");
drupal_add_js("$path/js/islandora_livingresearchlab.js");
?>

<div class="islandora-livingresearchlab-object islandora">
  <button id="livingresearchlab_image">Living Research!</button>
  <div class ="livingresearchlab_thumb">
    <?php print $variables['islandora_thumbnail_img'] ?>
  </div>
  <div class="islandora-basic-image-content-wrapper clearfix">
    <?php if (isset($islandora_content)): ?>
      <div class="islandora-livingresearchlab-content">
        <?php print $islandora_content; ?>
      </div>
    <?php endif; ?>
  </div>
