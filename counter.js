fetch('https://inportalediting.azurewebsites.net/api/visit/testpartitionkey/VISITOR')
      .then(response => response.json())
      .then(json => console.log(json))