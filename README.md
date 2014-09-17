#Express Skeleton Getting Started
##Generating the App
This is not applicable to running, only creating a new application.
```
npm install -g express-generator
express appDirname
cd appDirname/
npm install 
npm start
```
Application listens on port 3000  
##Running This App
`npm start`  
(from a different terminal)  
`npm test`  
In order to stop the application, issue an `npm stop`  
##Developing
`router.js` is the single router for Application
Requests are routed to their appropriate `controller` as designated by `router.js`. Each `controller` may have a corresponding `model` and each model a `schema` (also located under `models/`). The database is initialized within `base` controller from `models/database.js`, and this is where our models are instnatiated.  
`postman/` holds Data, Collection and Environment JSON files used by Postman, Jetpacks and Newman. Tests are written in Jetpack and Newman will run those tests and set `environment variables` and iterations based on the entries in our data file.
