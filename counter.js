fetch("https://inportalediting.azurewebsites.net/api/visit/testpartitionkey/VISITOR")
  .then((response) => {
    if (response.ok) {
      return response.json();
    } else {
      throw new Error("CAN'T FETCH API REQUEST");
    }
  })
  .then(data => {
      console.log(data);
      displayVisitor(data)
    })
  .catch((error) => console.error("FETCH ERROR:", error));

function displayVisitor(data) {
  const cocktail = data.visitor[0];
  const cocktailDiv = document.getElementById("visitor");
}  