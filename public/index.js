/*global axios*/

axios.get("/api/cables").then(function(response) {
  //.then runs code after data is retrieved with .get
  var cables = response.data; //contains JSON from api/cables back-end page
  console.log("The cables are", cables);

  var cableTemplate = document.querySelector("#cable-template"); //grabs template that contains card
  var cableContainer = document.querySelector(".row"); //grabs div where the card will be pasted

  cables.forEach(function(cable) {
    var card = cableTemplate.content.cloneNode(true);

    card.querySelector(".card-img-top").src = cable.images[0].url;
    card.querySelector(".card-title").innerText = cable.name;
    card.querySelector(".card-function").innerText = cable.function;
    card.querySelector(".card-description").innerText = cable.description;
    card.querySelector(".card-price").innerText = "$" + cable.price;
    card.querySelector(".card-model-year").innerText =
      "Model Year: " + cable.model_year;

    cableContainer.appendChild(card); //Pastes card into div
  });
});
