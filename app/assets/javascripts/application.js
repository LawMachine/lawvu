// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= jquery.min
//= require twitter/bootstrap
//= require turbolinks
//= require jquery.tokeninput
//= require bootstrap.min
//= jquery.fileupload-image
//= jquery.fileupload-process
//= jquery.fileupload
//= jquery.iframe-transport
//= canvas-to-blob.min
//= load-image.min
//= jquery.ui.widget
//= ace.min
//= ace-elements.min
//= require documents

// require_tree .


// $(document).ready(function() {
//   return $('#fileupload').fileupload({
//     dataType: 'json',
//     done: function(e, data) {
//       var file;
//       return file = data.result(console.log(data.textStatus, file.id, file.thumb(file.photo_file_size)), {
//         fail: function(e, data) {
//           return alert('Upload failed');
//         }
//       });
//     }
//   });
// });