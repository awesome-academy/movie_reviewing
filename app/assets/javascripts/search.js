$(document).ready(function() {
  var options = {
    getValue: "name",
    url: function(phrase) {
      return "/index.json?q=" + phrase;
    },
    template: {
      type: "links",
      fields: {
          link: "url"
      }
    },
    list: {
      maxNumberOfElements: 8,
      match: {
          enabled: true
      },
      sort: {
          enabled: true
      }
    }
  }

   $("[data-behavior='autocomplete']").easyAutocomplete(options)
});
