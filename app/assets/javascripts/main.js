$(document).ready(function () {
  // put the link to embedded content below
  let linkToEmbeddedContent = "";

  // initialize countdown
  //initializeCountdown();

  // initialize clipboard
  //initializeClipboard();

  changeNavbarBg($(window).scrollTop());

  $(window).on('scroll', function () {
    changeNavbarBg($(this).scrollTop());
  });

    /**
   * changeNavbarBg function:
   * adds / removes 'navbar-darker' class from navbar depending on scrollTop value
   * @param scrollTop {number}
   */
  function changeNavbarBg (scrollTop) {
    let navbar = $('#navbar');
    if (scrollTop > 0) {
      navbar.addClass('navbar-darker');
    } else if (!navbar.hasClass('.navbar-darker')) {
      navbar.removeClass('navbar-darker');
    }
  }
  // Smooth scroll
  $('a[href*="#"]:not([href="#"])').on('click', function() {
    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
      if (target.length) {
        $('html, body').animate({
          scrollTop: target.offset().top - 110
        }, 1000);
        return false;
      }
    }
  });

  // detect changing of input[type="email"] value
  // $('#input-email').on('change paste keyup', function () {
  //   let inputEl = $(this);
  //   let isValid = validateEmail(inputEl.val());
  //   if (isValid) {
  //     inputEl.parent().addClass('has-success');
  //     inputEl.addClass('form-control-success');
  //   } else {
  //     inputEl.parent().removeClass('has-success');
  //     inputEl.removeClass('form-control-success');
  //   }
  // });

  // /**
  //  * validateEmail function:
  //  * validates a string from input[type="email"]
  //  * @param email {string}
  //  * @returns {boolean}
  //  */
  // function validateEmail (email) {
  //     let regExp = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  //     return regExp.test(email);
  // }

  // /**
  //  * initializeClipboard function:
  //  * prepares data for copy, adds click event handler on items, adds animation
  //  * to show the user that text was copied.
  //  */
  // function initializeClipboard () {
  //   let clipboard = new Clipboard('.clipboard-container');

  //   let clipboardItems = $('.clipboard-container');
  //   for (var i = 0; i < clipboardItems.length; i++) {
  //     $(clipboardItems[i])
  //       .attr('data-clipboard-text', $(clipboardItems[i])
  //       .find('span.clipboard-text')
  //       .html());
  //   }

  //   clipboardItems.on('click', function (e) {
  //     e.preventDefault();

  //     let textToDisplay = 'Copied!';
  //     let clickedEl = $(this);
  //     let spanCopiedEl = clickedEl.find('span.clipboard-text');
  //     let spanEl = $('<span class="copied-info" />').html(textToDisplay);
  //     spanCopiedEl.addClass('hidden');
  //     clickedEl.addClass('copied').append(spanEl);

  //     setTimeout(function () {
  //       clickedEl.find('.copied-info').remove();
  //       clickedEl.removeClass('copied');
  //       spanCopiedEl.removeClass('hidden');
  //     }, 3000);
  //   });
  // }

  // /**
  //  * initializeCountdown function:
  //  * gets params for FlipClock and runs countdown
  //  */
  // function initializeCountdown () {
  //   let countdownSeconds = getCounterSeconds(2, 3, 4); // 2 days 3 hours 4 minutes

  //   let countdown = new FlipClock($('#countdown'), countdownSeconds, {
  //     clockFace: 'DailyCounter',
  //     countdown: true,
  //     showSeconds: false,
  //     callbacks: {
  //       stop: countdownStopped
  //     }
  //   })
  // }

  // /**
  //  * getCounterSeconds function:
  //  * converts number of days, hours and minutes to seconds for countdown.
  //  * default time for countdown is 7 days 0 hours 0 minutes
  //  * @param days {number}
  //  * @param hours {number}
  //  * @param minutes {number}
  //  * @returns {number}
  //  */
  // function getCounterSeconds (days = 7, hours = 0, minutes = 0) {
  //   return days * 24 * 60 * 60 + hours * 60 * 60 + minutes * 60;
  // }

  // /**
  //  * countdownStopped function:
  //  * detects when countdown stopped and removes this element from the DOM
  //  */
  // function countdownStopped () {
  //   $('#countdown').remove();
  //   $('.time-left-info').remove();
  //   if (!linkToEmbeddedContent.length) {
  //     linkToEmbeddedContent = "https://www.youtube.com/embed/oLBwibYSzEk";
  //   }
  //   $('.main-section').prepend($(`<iframe width="80%" height="400px" src="${linkToEmbeddedContent}" />`));
  //   $('.down-section-info').css('margin-top', '260px');
  // }
});
