// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function(){

  function print_lists(data) {
    console.log(data);
    var lists_container = $(".lists");
    _(data).each( function(list){
      lists_container.append('<li class="ui-state-default"><h2>'+list.name+'</h2>');
      // if (list.items.length > 0) {
      //   _(list.items).each( function (item){
      //     console.log(item);
      //   lists_container.append('<p>'+item.name+'</p>');
      //   lists_container.append('<p>'+item.comment+'</p>');
      //   });
      // }
      lists_container.append('</li>');

    });
  };

  function save_lists(){

  };

    $( "#sortable" ).sortable();
    $( "#sortable" ).disableSelection();

  $.getJSON('http://localhost:3000/list.json', print_lists)
});

