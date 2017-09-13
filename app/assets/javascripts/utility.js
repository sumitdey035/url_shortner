var US = US || {};

US.Utility = {
  copyToClipboard: function(elementId) {
    var aux = document.createElement("input");
    aux.setAttribute("value", document.getElementById(elementId).innerHTML);
    document.body.appendChild(aux);
    aux.select();
    document.execCommand("copy");
    document.body.removeChild(aux);
  }
};

$(function () {
  (document).on('click', '.copy_link', function () {
    US.Utility.copyToClipboard('alert-link');
  });
});