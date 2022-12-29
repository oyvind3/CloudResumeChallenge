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

      document.querySelector('div id="visitor"').insertAdjacentHTML('beforeend', markup);
    })
  })
  .catch(error => console.log(error));
//      console.log(data);
//      displayVisitor(data)

//function displayVisitor(data) {
//  const visitor = data;
//  const visitorDiv = document.getElementById("visitor");
//}  