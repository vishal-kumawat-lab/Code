 const express = require('express'); 
 const app = express(); 
 app.get('/', (req, res) => { 
 res.send('8byte intern Assignment Successfully Deployed '); 
 }); 
 app.listen(3000, () => { 
 console.log('Server running on port 3000'); 
 }); 
