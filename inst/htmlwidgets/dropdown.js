HTMLWidgets.widget({

  name: 'dropdown',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function() {

        // TODO: code to render the widget, e.g.

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size
          controller.resizeUpdate();


      }

    };
  }
});
