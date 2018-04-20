// Copyright © 2017 Dmitry Sikorsky. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

function getCulture() {
  if (location.href.indexOf("/ru/") != -1) {
    return "ru";
  }

  if (location.href.indexOf("/uk/") != -1) {
    return "uk";
  }

  return "en";
}

function toggleMaster() {
  var master = $(".master-detail__master");
  var detail = $(".master-detail__detail");

  if (master.is(":visible")) {
    master.slideUp("fast");
    detail.show();
  }

  else {
    master.slideDown("fast");
    detail.hide()
  }
}