$(document).ready(function() {
  $('.ui.dropdown').dropdown();
  $(".sidebar-menu-toggler").on('click', function () {
    var target = $(this).data('target');
    $(target)
      .sidebar({
        dimPage: true,
        transition: 'push',
        mobileTransition: 'push'
      })
    .sidebar('toggle');
  });
});