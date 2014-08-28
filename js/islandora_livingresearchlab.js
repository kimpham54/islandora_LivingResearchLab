
(function($) {
  Drupal.behaviors.IslandoraLivingResearchLab = {
    attach: function(context, settings) {
      $('#livingresearchlab_image').hide();
      $('.livingresearchlab_thumb').click(function() {
        $('.livingresearchlab_thumb').hide('slow');
        $('#livingresearchlab_image').show('slow');
      });
      $('#livingresearchlab_image').click(function() {
        $('.livingresearchlab_thumb').show('slow');
        $('#livingresearchlab_image').hide('slow');
      });
    }
  };
})(jQuery);
