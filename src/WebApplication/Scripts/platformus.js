// Copyright © 2017 Dmitry Sikorsky. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

function getCulture() {
  if (location.pathname == "/") {
    return "en";
  }

  return location.pathname.split("/")[1];
}

function combineLocalizedUrl(url) {
  return "/" + getCulture() + url;
}

function toggleHeader() {
  var header = $(".header");

  if (header.is(":visible")) {
    header.slideUp("fast");
  }

  else {
    header.slideDown("fast");
  }
}

function addToCart(productId) {
  $.post(
    combineLocalizedUrl("/cart/add-to-cart"),
    { productId: productId },
    function () {
      location.reload();
    }
  );

  return false;
}

function removeFromCart(positionId) {
  $.post(
    combineLocalizedUrl("/cart/remove-from-cart"),
    { positionId: positionId },
    function () {
      location.reload();
    }
  );

  return false;
}