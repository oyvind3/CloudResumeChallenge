const ul = document.getElementById('visitors');
const list = document.createDocumentFragment();
fetch('https://inportalediting.azurewebsites.net/api/visit/testpartitionkey/VISITOR')
      .then(response => response.json())
      .then(json => console.log(json))
      var obj = JSON.parse(response)
      .then((response) => {
        return response.json();
      })
      .then((data) => {
        let visitors = data;

        visitors.map(function(visitor1) {
          let li =document.createElement('li');
          let visitor = document.createElement('h2');
          let testpartitionkey = document.createElement('span');

          visitor.innerHTML = `${visitor1.visitor}`;
          testpartitionkey.innerHTML = `${visitor1.testpartitionkey}`;

          li.appendChild(visitor);
          li.appendChild(testpartitionkey);
          list.appendChild(li);
          ul.appendChild(list);
        });
      })
      .catch(function(error) {
        console.log(error);
      });