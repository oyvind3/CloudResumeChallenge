fetch("https://inportalediting.azurewebsites.net/api/visit/testpartitionkey/VISITOR")
  .then((response) => {
    if (response.ok) {
      return response.json();
    } else {
      throw new Error("CAN'T FETCH API REQUEST");
    }
  })
  .then(data => {
    data.forEach(visitor => {
      const markup = `<li>${visitor.visitor}</li>`;

      document.querySelector('ul').insertAdjacentHTML('beforeend', markup);
    })
  })
//      console.log(data);
//      displayVisitor(data)
  .catch((error) => console.error("FETCH ERROR:", error));

//function displayVisitor(data) {
//  const visitor = data;
//  const visitorDiv = document.getElementById("visitor");
//}  