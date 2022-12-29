fetch('https://inportalediting.azurewebsites.net/api/visit/testpartitionkey/VISITOR')
  .then((response) => {
    if (response.ok) {
      return response.json();
    } else {
      throw new Error("CAN'T FETCH API REQUEST");
    }
  })
  .then(data => {
      console.log(data);
      displayData(data)
    })
  .catch((error) => console.error("fetch error:", error));
