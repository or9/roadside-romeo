var util = require("util");
module.exports = Home;

function Home() {
	require("./base").call(this, "home");
	this.get = get;

  function get(req, res) {
    var renderedPageProperties = {};
    util.log("getting response from req.query: ", req.query);
    for(var key in req.query) {
      renderedPageProperties[key] = req.query[key];
    }
    res.render('index', renderedPageProperties);
  }

}
