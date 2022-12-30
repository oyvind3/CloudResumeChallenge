const ul = document.getElementById('visitors');
const list = document.createDocumentFragment();
fetch('https://inportalediting.azurewebsites.net/api/visit/testpartitionkey/VISITOR')
      .then(response => response.json())
      .then(json => console.log(json))
      .then((response) => {
        return response.json();
      })