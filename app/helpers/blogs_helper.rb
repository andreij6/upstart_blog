module BlogsHelper
  def donate_bitcoin
    '<a class="coinbase-button" data-code="692d116713c02a4a88dff01094dee897" data-button-style="donation_large" href="https://coinbase.com/checkouts/692d116713c02a4a88dff01094dee897">Donate Bitcoins</a><script src="https://coinbase.com/assets/button.js" type="text/javascript"></script>'.html_safe
  end

end
