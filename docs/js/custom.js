document.addEventListener("DOMContentLoaded", function(){
  var profile_img = document.querySelector("#profile-img");
  var vcard_qr = document.querySelector("#vcard-qr");

  function toggle_img_qr() {
    if (vcard_qr.style.display === "none") {
      // QR code is invisible
      vcard_qr.style.removeProperty("display");
      profile_img.style.display = "none";
    } else {
      // Profile image is invisible
      profile_img.style.removeProperty("display");
      vcard_qr.style.display = "none";
    }
  }

  profile_img.addEventListener("click", toggle_img_qr);
  vcard_qr.addEventListener("click", toggle_img_qr);
});
