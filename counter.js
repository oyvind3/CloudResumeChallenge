const api_url = 'https://inportalediting.azurewebsites.net/api/visit/testpartitionkey/VISITOR'
async function getISS() {
  const response = await fetch(api_url);
  const data = await response.json();
  console.log(data);
  console.log(data.visitor);
  const {visitor} = data
  document.getElementById('visit').textContent = visitor;
}
getISS();

