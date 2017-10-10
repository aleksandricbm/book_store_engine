$(document).ready(function() {
  $( "#use_billing" ).click(function() {
      $("div.col-md-5.col-md-offset-1").toggle("slow");
  });

  if ($("#credit_card_number".length)) { $("#credit_card_number").mask("9999-9999-9999-9999"); }
  if ($("#credit_card_expired".length)) { $("#credit_card_expired").mask("99/99"); }
  if ($("#credit_card_cvv".length)) { $("#credit_card_cvv").mask("9999"); }
});
