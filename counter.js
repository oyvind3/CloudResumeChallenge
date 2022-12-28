fetch('https://inportalediting.azurewebsites.net/api/visit/testpartitionkey/VISITOR')
.then(data => {
return data.json();
})
.then(post => {
console.log("visitor");
});